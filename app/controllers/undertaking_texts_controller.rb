class UndertakingTextsController < ApplicationController
     before_action :authorize_admin
    def index
        @utext = UndertakingText.find(1)
    end
    def new
        @utext = UndertakingText.new
    end
    def create
        @utext = UndertakingText.new(text_params)
        respond_to do |format|
            if @utext.save
            flash[:notice] = 'Text Added Successfully'
            # <%= link_to 'View Students', users_path(:admin => "students_view") %>
            format.html { redirect_to users_path(:admin => "undertaking_text")}
            format.json { render :show, status: :created, location: @utext }
            else
                    format.html { render :new }
                    format.json {  render json: @utext.errors, status: :unprocessable_entity }
            end
        end
    end
    def edit
        @utext=UndertakingText.find(params[:id])
    end
    def update
        @utext=UndertakingText.find(params[:id])
        respond_to do |format|
            if @utext.update(text_params)
              format.html { redirect_to undertaking_texts_path, notice: 'Text Updated Successfully' }
              format.json { render :show, status: :ok, location: @utext }
            else
              format.html { render :edit }
              format.json { render json: @utext.errors, status: :unprocessable_entity }
            end
        end
    end
    
    private
    def text_params
      params.require(:undertaking_text).permit(:display_text)
    end
end
