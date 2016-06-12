class StudentsController < ApplicationController
  before_action :authorize_admin
  
  skip_before_action :authorize_admin, only: [:show]
  def index
    if params[:sort]

      @students=Student.order(params[:sort] + ' ' + params[:direction])
      @active_session = CoachingSession.where(:status => true).take
      @students = @students.where(:session => @active_session.name)
      @count = @students.count
      @link = "students_view"
    else
      @students = Student.all
      @active_session = CoachingSession.where(:status => true).take
      @students = @students.where(:session => @active_session.name)
      @count = @students.count
      @link = "students_view"
    end
    if params[:admin] == "view_student"
      @student=Student.find(params[:id])
      @link = "view_student"
    end
      
    
  end
  def show
    @student=Student.find(params[:id])
    @active_session = CoachingSession.where(:status => true).take
    
    begin
      Tracking.create(:session => @active_session.name,:downloaded => true,:name => @student.name,:tracking_id => @student.tracking_id)
    rescue
    end
    
    @voucher=VoucherMapping.find_by_tracking_id(params[:id])
    if @voucher
      fee_voucher = FeeVoucher.find_by_voucher_no(@voucher.voucher_no)
      if not fee_voucher
        student = Student.find_by_tracking_id(params[:id])
        FeeVoucher.create(:name => student.name , :voucher_no => @voucher.voucher_no , :tracking_id => student.tracking_id , :total_amount => "2200" ,:payment_deadline => "20160629",:status => "unpaid")
      end
    else
      voucher=VoucherNo.last
      voucher_no_old = voucher.voucher_no
      voucher_no_new = voucher_no_old.to_i + 1
      voucher_no_new = voucher_no_new.to_s
      VoucherNo.last.destroy
      VoucherNo.create(:voucher_no => voucher_no_new)
      VoucherMapping.create(:session => @active_session.name, :voucher_no => voucher_no_old,:tracking_id => @student.tracking_id)
      student = Student.find_by_tracking_id(params[:id])
      FeeVoucher.create(:name => student.name , :voucher_no => voucher_no_old , :tracking_id => student.tracking_id , :total_amount => "2200" ,:payment_deadline => "June 29,2016",:status => "unpaid" , :mobile_number => student.mobile_number , :email => student.email , :phone_number => student.phone_number)
      
    end
    @voucher=VoucherMapping.find_by_tracking_id(params[:id])
    
    respond_to do |format|
        format.html
        format.pdf do
            pdf = StudentVoucherPdf.new(@student,@active_session,@voucher)
            send_data pdf.render, filename: "#{@student.name}'s voucher'.pdf", type: "application/pdf", disposition: "inline"
        end
    end
  end
  def new
    @student = Student.new
  end
  def view
    @student=Student.find(params[:id])
  end
  def create
    @student = Student.new(student_params)
    @active_session = CoachingSession.where(:status => true).take
    @student.session = @active_session.name
    if @student.city
      if @student.city.titleize()=="Lahore"
          @student.boarder = false
      else
          @student.boarder = true
      end
    end
    respond_to do |format|
      if @student.save
        User.create!(:email => @student.username,:password => @student.password,:role => "student")
        # @name = CoachingSession.where(:status => true).take.name
        # Undertaking.create!(:tracking_id => params[:id],:data => Null,:via => "Mail",:session => @name,:admin_status => false,:status => false)
        flash[:notice] = 'Student was successfully created.'
        format.html { redirect_to students_path}
        format.json { render :show, status: :created, location: @student }
      else
     #   redirect_to new_student_path
        format.html { render :new }
        format.json {  render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end
  def edit
    @student=Student.find(params[:id])
  end
  def update
    @student=Student.find(params[:id])
    @user = User.find_by_email(@student.username)
      respond_to do |format|
        begin
          @student.update(student_params)
          
          @user.update(:password => @student.password,:email => @student.username)
          format.html { redirect_to students_path, notice: 'Student was successfully updated.' }
          format.json { render :show, status: :ok, location: @student }
        rescue
          format.html { render :edit }
          format.json { render json: @student.errors, status: :unprocessable_entity }
        end
      end
  end
  def delete_all
    # begin
      @students=Student.where(:session => CoachingSession.where(:status => true).take.name)
      @students.each do |student|
        user = User.where(:email => student.username).take
        student.destroy
        user.destroy
      end
      flash[:notice] = 'All Students were successfully destroyed.'
      redirect_to :controller => "students",:action => "index"
    # rescue
    # end
  end
  def destroy
    @student=Student.find(params[:id])
    @user = User.where(:email => @student.username).take
    @student.destroy
    @user.destroy
    respond_to do |format|
      # format.html { redirect_to students_url}
      format.html { redirect_to students_path }
      
      flash[:notice] = 'Student was successfully destroyed.'
      format.json { head :no_content }
    end
  end
  def import
    Student.import(params[:file])
    redirect_to students_path, notice: "Students imported"
  end
  def import_sample
  end
  def export
    package = Axlsx::Package.new
    workbook = package.workbook
    workbook.add_worksheet(name: "Basic work sheet") do |sheet|
      sheet.add_row ["stream", "tracking_id","name", "father_name","m_o_level_stream","graduation_year","o_level_grades", "matric_percentage", "DOB", "gender","address1","address2","address3", "city","district","province","phone_number", "mobile_number", "monthly_income","income_range","session","boarder","email", "username"]
      @students=Student.all
      @active_session = CoachingSession.where(:status => true).take
      @students = @students.where(:session => @active_session.name)
      @students.each do |st|
        sheet.add_row [st.stream, st.tracking_id,st.name, st.father_name,st.m_o_level_stream,st.graduation_year,st.o_level_grades, st.matric_percentage,st.DOB,st.gender,st.address1,st.address2,st.address3, st.city,st.district,st.province,st.phone_number,st.mobile_number,st.monthly_income,st.income_range, st.session,st.boarder,st.email,st.username]
      end
    end
    send_data package.to_stream.read, :filename => "students.xlsx"
  end
  def export_sample
    package = Axlsx::Package.new
    workbook = package.workbook
    workbook.add_worksheet(name: "Basic work sheet") do |sheet|
      sheet.add_row ["stream", "tracking_id","name", "father_name","m_o_level_stream","graduation_year","o_level_grades", "matric_percentage", "DOB", "gender","address1","address2","address3", "city","district","province","phone_number", "mobile_number", "monthly_income","income_range","boarder","email", "username","password"]
    end
    send_data package.to_stream.read, :filename => "students.xlsx"
  end
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_student
    @student = Student.find(params[:id])
  end
  # Never trust parameters from the scary internet, only allow the white list through.
  def student_params
    params.require(:student).permit( :name,:father_name,:tracking_id, :session,:stream,:m_o_level_stream,:graduation_year,:matric_percentage,:o_level_grades,:DOB,:gender,:address1,:address2,:address3,:city,:district,:province,:mobile_number,:phone_number,:monthly_income,:income_range,:boarder, :email, :username, :password)
  end  
  
end
