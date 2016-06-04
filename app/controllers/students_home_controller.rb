class StudentsHomeController < ApplicationController
  def index
    @student=Student.find_by_username(current_user.email)
  end

  def profile
    @student=Student.find_by_username(current_user.email)
  end
end
