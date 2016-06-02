class CoachingSessionsController < ApplicationController
   skip_before_action :require_session, :only => [:index, :new,:create,:update,:edit,:delete,:destroy,:activate]
    def index
        @coaching_sessions= CoachingSession.all
    end
    def new
        @coaching_session= CoachingSession.new
    end
    def create
        @coaching_session = CoachingSession.new(coaching_session_params)
        respond_to do |format|
          if @coaching_session.save
            format.html { redirect_to url_for(:controller => :coaching_sessions), notice: 'Session was successfully created.' }
            format.json { render :show, status: :created, location: @coaching_session }
          else
            format.html { render :new }
            format.json { render json: @coaching_session.errors, status: :unprocessable_entity }
          end
        end
    end
    def edit
        @coaching_session=CoachingSession.find(params[:id])
    end
    def update
        @coaching_session=CoachingSession.find(params[:id])
        respond_to do |format|
            if @coaching_session.update(coaching_session_params)
                format.html { redirect_to url_for(:controller => :coaching_sessions), notice: 'Session was successfully updated' }
                format.json { render :show, status: :ok, location: @coaching_session }
            else
                format.html { render :edit }
                format.json { render json: @coaching_session.errors, status: :unprocessable_entity }
            end
        end
    end
    def delete
        @coaching_session=CoachingSession.find(params[:id])
    end
    def destroy
        @coaching_session=CoachingSession.find(params[:id])
        @coaching_session.destroy
        respond_to do |format|
          format.html { redirect_to url_for(:controller => :coaching_sessions), notice: 'Session was successfully destroyed' }
          format.json { head :no_content }
        end
    end
    def activate
        @coaching_session=CoachingSession.find(params[:id])
        @active = CoachingSession.where(:status => true).take
        if @active
            @active.update(:status => false)
        end
        if @coaching_session
            @coaching_session.update(:status => true)
            redirect_to url_for(:controller => :coaching_sessions), notice: 'Session was successfully updated'
        end
    end
    def coaching_session_params
      params.require(:coaching_session).permit(:coaching_session_id, :name,:status )
    end
end
