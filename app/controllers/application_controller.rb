class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :require_session
  private
  def require_session
    unless CoachingSession.where(:status => true).take
      flash[:notice] = "No session activated"
      redirect_to url_for(:controller => :coaching_sessions)
      return false
    else
      return true
    end
  end
  
end
