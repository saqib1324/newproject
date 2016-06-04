class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    if current_user.role == "student"
      redirect_to :controller => :students_home,  :action => :index
    end
  end
end
