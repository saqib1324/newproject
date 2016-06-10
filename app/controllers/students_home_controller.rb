class StudentsHomeController < ApplicationController
  def index
    @student=Student.find_by_username(current_user.email)
    tracking = Tracking.find_by_tracking_id(@student.tracking_id)
    if tracking
      @link = "download"
    else
      @link = "default"
    end
  end

  def profile
    @student=Student.find_by_username(current_user.email)
  end
  def accept_undertaking
      begin
          student = Student.find(params[:id])
          active_session = CoachingSession.where(:status => true).take.name
          Tracking.create(:session => active_session,:tracking_id => params[:id],:name => student.name,:accepted => true)
          flash[:notice] = "Undertaking accepted"
          redirect_to :controller => "students_home",:action => "index"
      rescue
          redirect_to :controller => "students_home",:action => "index"
      end
  end
  def password_reset
  end
  def reset
    @user = current_user
    if params[:new_password] == params[:confirm_password]
      @user.update(:password => params[:new_password])
    else
      flash[:notice]="password and confirm password don't match. confirm again"
      redirect_to :controller => "students_home",:action => "password_reset"
    end
  end
end
