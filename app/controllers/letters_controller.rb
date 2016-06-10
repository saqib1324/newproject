class LettersController < ApplicationController
  def index
    
      @letter = Letter.find(1)
  end
  def new
      @letter = Letter.new
  end
  def create
      @letter = Letter.new(letter_params)
      respond_to do |format|
          if @letter.save
            flash[:notice] = 'Letter Text Added Successfully'
            format.html { redirect_to letter_path,  notice: 'Text Updated Successfully'}
            format.json { render :show, status: :created, location: @utext }
          else
            format.html { render :new }
            format.json {  render json: @letter.errors, status: :unprocessable_entity }
          end
      end
  end
  def show
    respond_to do |format|
        format.html
        format.pdf do
            pdf = LettersPdf.new()
            send_data pdf.render, filename: "letters'.pdf", type: "application/pdf", disposition: "inline"
        end
    end
  end
  
  def edit
      @letter=Letter.find(params[:id])
  end
  def update
      @letter=Letter.find(params[:id])
      respond_to do |format|
          if @letter.update(text_params)
            format.html { redirect_to letters_path,  notice: 'Letter Text Updated Successfully'}
            format.json { render :show, status: :ok, location: @letter }
          else
            format.html { render :edit }
            format.json { render json: @letter.errors, status: :unprocessable_entity }
          end
      end
  end
  
  private
  def text_params
    params.require(:letter).permit(:boarder_letter_text, :day_scholar_letter_text)
  end
end
