class VoucherNosController < ApplicationController
  def index
  end
  def show
  end
  def new
    @voucher = VoucherNo.new
  end
  def create
    @voucher = VoucherNo.new(voucher_params)
    respond_to do |format|
      if @voucher.save
        flash[:notice] = 'Voucher successfully mapped.'
        # format.html { redirect_to students_path}
        format.json { render :show, status: :created, location: @voucher }
      else
     #   redirect_to new_student_path
        format.html { render :new }
        format.json {  render json: @voucher.errors, status: :unprocessable_entity }
      end
    end
  end
  def update
    @voucher=VoucherNo.find_by_voucher_no(params[:voucher_no])
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
    @voucher=VoucherNo.find_by_voucher_no(params[:voucher_no])
    @voucher.destroy
    respond_to do |format|
       format.html { redirect_to voucher_mappings_path}
      # format.html { redirect_to students_path }
      
      format.json { head :no_content }
    end
  end
  def update_it
    @voucher=VoucherNo.find_by_voucher_no(params[:voucher_no])
    @voucher.destroy
    respond_to do |format|
       format.html { redirect_to voucher_mappings_path}
      # format.html { redirect_to students_path }
      
      format.json { head :no_content }
    end
  end
  private
  def voucher_params
    params.require(:voucher_no).permit(:voucher_no)
  end

end
