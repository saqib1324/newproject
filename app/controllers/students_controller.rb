class StudentsController < ApplicationController
  def index
    if params[:sort]
      # @temp = params[:sort]
      # @students=Student.order(@temp: :desc )
      @students=Student.order(params[:sort] + ' ' + params[:direction])
      @active_session = CoachingSession.where(:status => true).take
      @students = @students.where(:session => @active_session.name)
      @link = "students_view"
    else
      @students = Student.all
      @active_session = CoachingSession.where(:status => true).take
      @students = @students.where(:session => @active_session.name)
      @link = "students_view"
    end
    if params[:admin] == "view_student"
      @student=Student.find(params[:id])
      @link = "view_student"
    end
      
    
  end
  def show
    # @student=Student.find(params[:id])
    # respond_to do |format|
    #     format.html
    #     format.pdf do
    #         pdf = StudentVoucherPdf.new(@student)
    #         send_data pdf.render, filename: "#{@student.name}'s voucher'.pdf", type: "application/pdf", disposition: "inline"
    #     end
    # end
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
      respond_to do |format|
        if @student.update(student_params)
          format.html { redirect_to students_path, notice: 'Student was successfully updated.' }
          format.json { render :show, status: :ok, location: @student }
        else
          format.html { render :edit }
          format.json { render json: @student.errors, status: :unprocessable_entity }
        end
      end
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
      sheet.add_row ["name", "tracking_id", "father_name","matric_percentage", "session", "DOB", "SEX", "city","email","phone_number", "secondary_phone_number", "mailing_address", "username"]
      @students=Student.all
      @active_session = CoachingSession.where(:status => true).take
      @students = @students.where(:session => @active_session.name)
      @students.each do |st|
        sheet.add_row [st.name, st.tracking_id, st.father_name,st.matric_percentage, st.session, st.DOB, st.SEX, st.city,st.email, st.phone_number, st.secondary_phone_number, st.mailing_address, st.username]
      end
    end
    send_data package.to_stream.read, :filename => "students.xlsx"
  end
  def export_sample
    package = Axlsx::Package.new
    workbook = package.workbook
    workbook.add_worksheet(name: "Basic work sheet") do |sheet|
      sheet.add_row ["name", "tracking_id", "father_name", "matric_percentage", "monthly_income", "section", "DOB", "SEX", "city","email","phone_number", "secondary_phone_number", "mailing_address", "username","password"]
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
    params.require(:student).permit( :name, :session, :tracking_id, :matric_percentage, :monthly_income, :SEX, :section,:city, :father_name, :DOB,  :email, :phone_number, :secondary_phone_number, :mailing_address, :username, :password)
  end  
  
end
