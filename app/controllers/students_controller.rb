class StudentsController < ApplicationController
  def index
    if params[:sort]
      @students=Student.order(params[:sort])
    else
      @students = Student.all
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
  def create
    @student = Student.new(student_params)
    @active_session = CoachingSession.where(:status => true).take
    @student.session = @active_session.name
    respond_to do |format|
      if @student.save
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
    @student.destroy
    respond_to do |format|
      # format.html { redirect_to students_url}
      format.html { redirect_to students_path }
      
      flash[:notice] = 'Student was successfully destroyed.'
      format.json { head :no_content }
    end
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
