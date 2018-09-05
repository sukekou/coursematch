class CoursesController < ApplicationController
  def show
    @course=Course.find(params[:id])
    @users=@course.users
  end
end
