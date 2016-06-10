class VoucherMappingsController < ApplicationController
  def index
    @voucher = VoucherNo.last
    @vouchers = VoucherMapping.all
    @active_session = CoachingSession.where(:status => true).take
    @vouchers = @vouchers.where(:session => @active_session.name)
    
  end
  def show
    @student = Student.find_by_tracking_id(params[:id])
    @active_session = CoachingSession.where(:status => true).take
    @voucher=VoucherMapping.find_by_tracking_id(params[:id])
    if @voucher
      fee_voucher = FeeVoucher.find_by_voucher_no(@voucher.voucher_no)
      if fee_voucher
        fee_voucher.update(:status => "cancelled")
      end
      @voucher.destroy
      voucher=VoucherNo.last
      voucher_no_old = voucher.voucher_no
      voucher_no_new = voucher_no_old.to_i + 1
      voucher_no_new = voucher_no_new.to_s
      VoucherNo.last.destroy
      VoucherNo.create(:voucher_no => voucher_no_new)
      VoucherMapping.create(:session => @active_session.name, :voucher_no => voucher_no_old,:tracking_id => params[:id])
      student = Student.find_by_tracking_id(params[:id])
      FeeVoucher.create(:name => student.name , :voucher_no => voucher_no_old , :tracking_id => student.tracking_id , :total_amount => "2200" ,:payment_deadline => "June 29,2016",:status => "unpaid", :mobile_number => student.mobile_number , :email => student.email , :phone_number => student.phone_number)
      
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
    @voucher = VoucherMapping.new
  end
  def create
    @voucher = VoucherMapping.new(voucher_params)
    @active_session = CoachingSession.where(:status => true).take
    @voucher.session = @active_session.name
    @voucher.voucher_no = params[:start]
    respond_to do |format|
      if @voucher.save
        flash[:notice] = 'Voucher successfully mapped.'
        format.html { redirect_to students_path}
        format.json { render :show, status: :created, location: @voucher }
      else
     #   redirect_to new_student_path
        format.html { render :new }
        format.json {  render json: @voucher.errors, status: :unprocessable_entity }
      end
    end
  end
  def update
    @voucher=VoucherMapping.find_by_voucher_no(params[:voucher_no])
      respond_to do |format|
        if @voucher.update(voucher_params)
          format.html { redirect_to students_path, notice: 'Voucher successfully mapped' }
          format.json { render :show, status: :ok, location: @voucher }
        else
          format.html { render :edit }
          format.json { render json: @voucher.errors, status: :unprocessable_entity }
        end
      end
  end
  
  def destroy
    @voucher=VoucherMapping.find_by_voucher_no(params[:voucher_no])
    @voucher.destroy
    respond_to do |format|
      # format.html { redirect_to students_url}
      # format.html { redirect_to students_path }
      
      format.json { head :no_content }
    end
  end
  def delete_all
    ActiveRecord::Base.connection.execute("truncate voucher_mappings;truncate trackings;truncate undertakings;")
    redirect_to voucher_mappings_path
  end
  def iterate
    voucher = params[:voucher_starting_no]
    begin
      @voucher_old = VoucherNo.last.destroy
      VoucherNo.create(:voucher_no => voucher)
    rescue
      VoucherNo.create(:voucher_no => voucher)
    end
    
    
    redirect_to voucher_mappings_path
  end
  def bulk_download
    @voucher = VoucherNo.last
    if @voucher
      @students=Student.all
      @active_session = CoachingSession.where(:status => true).take
      @students = @students.where(:session => @active_session.name,:boarder => true)
      respond_to do |format|
          format.html
          format.pdf do
              pdf = BulkDownloadPdf.new(@students,@active_session)
              send_data pdf.render, filename: "Fee_vouchers.pdf", type: "application/pdf", disposition: "inline"
          end
      end
    else
      flash[:notice] = "Specify a starting fee voucher number first "
      redirect_to voucher_mappings_path
    end
  end
  private
  # Use callbacks to share common setup or constraints between actions.
  
  # Never trust parameters from the scary internet, only allow the white list through.
  def voucher_params
    params.require(:voucher_no).permit( :status,:voucher_no,:tracking_id)
  end
end
