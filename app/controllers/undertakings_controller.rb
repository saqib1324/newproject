class UndertakingsController < ApplicationController
    
    def index
        if params[:admin] == "view_file"
            @file = Undertaking.find_by(:tracking_id => params[:id])
            if (@file)
                send_data( @file.data , :type => @file.mime_type, :filename => "#{@file.file_name}", :disposition => "inline")
            else
                flash[:notice] = "No file uploaded yet."
            end    
        elsif params[:admin] == "accept_file"
            Undertaking.create_mail(params[:id])
            @undertaking = Undertaking.find_by(:tracking_id => params[:id])
            if (@undertaking)
                flash[:notice] = "Fee Voucher accepted"
                redirect_to url_for(:controller => "undertakings",:action => "pending")
            else
                flash[:notice] = "Oops! Something went wrong.Please try again"
                redirect_to url_for(:controller => "undertakings",:action => "pending")
            end
        elsif params[:admin] == "reject_file"
            @file = Undertaking.find_by(:tracking_id => params[:id])
            if (@file)
                @file.update(:admin_status => false)
                flash[:notice] = "File Rejected"
                @student = Student.find_by_tracking_id(@file.tracking_id)
            #AdminMailer.sample_email(@student).deliver
            else
                flash[:notice] = "File not found"
            end
            redirect_to redirect_to url_for(:controller => "undertakings",:action => "manage")        
        else
            @undertakings = Undertaking.where(:status => true,:admin_status => true).all
        end
    end
    
    def show
        @undertaking = Undertaking.where(:tracking_id => session[:id])
    end
    
    def new
        @undertaking = Undertaking.new
    end
    
    def create
    # build a photo and pass it into a block to set other attributes
        @undertaking = Undertaking.new(set_params) do |t|
            @id =Student.find_by_username(current_user.email).tracking_id
            t.tracking_id = @id
            if params[:undertaking][:data]
                t.via = "Electronic"
                t.data      = params[:undertaking][:data].read
                t.file_name  = params[:undertaking][:data].original_filename
                t.mime_type = params[:undertaking][:data].content_type
                t.session = CoachingSession.where(:status => true).take.name
                t.admin_status = false
                t.status = true
            end
        end
        
        # normal save
        if @undertaking.save
          flash[:notice] = 'Photo was successfully Uploaded.'
          redirect_to "/students_home/index"
          
          else
          render :action => "new"
        end
    end
    def update
        @undertaking = Undertaking.find(params[:id])
        if @undertaking.update(set_params)
          flash[:notice] = "New File Uploaded Successfully"
          redirect_to :controller => "users", :action => "student_index"
        end
    end
    def destroy
        @undertaking = Undertaking.where(:tracking_id => session[:id]).take
        if @undertaking.present?
          @undertaking.destroy
          flash[:notice] = "file destroyed successfully"
        end
        redirect_to(:controller => "users", :action => "student_index", :std => "upload")
    end
    def pending
        @active_session =      CoachingSession.where(:status => true).take.name
        @ids =  Undertaking.find_by_sql "select tracking_id from undertakings where status = true AND session = (select name from coaching_sessions where status = true )"
        @students =     Student.where.not(tracking_id: @ids).where(:session => @active_session)
    end
    def manage
        @active_session = CoachingSession.where(:status => true).take.name
        @studentsp = Undertaking.where(:status => true,:admin_status => false,:session => @active_session).all
        @students = Undertaking.where(:status => true,:admin_status => true,:session => @active_session).all        
    end
    def upload
        @id =Student.find_by_username(current_user.email).tracking_id
        @file = Undertaking.where(:tracking_id => @id).take
        if (@file)
            @undertaking = "already_uploaded"
        else
            @undertaking = Undertaking.new
        end 
    end
    def displayfile
        @id =Student.find_by_username(current_user.email).tracking_id
        @file = Undertaking.find_by(:tracking_id => @id)
        if (@file)
            send_data( @file.data , :type => @file.mime_type, :filename => "#{@file.file_name}", :disposition => "inline")
        else
            flash[:notice] = "No file uploaded yet."
        end
    end
    private
    def set_params
        params.require(:undertaking).permit( :tracking_id, :status,:session, :admin_status, :file_name, :data, :mime_type)
    end
end
