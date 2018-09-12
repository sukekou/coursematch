class CoursesController < ApplicationController
  before_action :require_user_logged_in, only: [:show]
  def show
    @course=Course.find(params[:id])
    @users=@course.users
    @old_users = @users.select{|user| user.updated_at.day != Date.today.day}
  end
end
