class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :require_session
  
  before_action :authenticate_user! 
  def authorize_student
    if current_user.role == 'student'
      return true
    else
      flash[:notice] = "You are not authorized to view this page"
      redirect_to :controller => :students, :action => :index
    end
  end
  def authorize_admin
    if current_user.role == 'admin'
      return true
    else
      flash[:notice] = "You are not authorized to view this page"
      redirect_to :controller => :students_home, :action => :index
    end
  end
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
