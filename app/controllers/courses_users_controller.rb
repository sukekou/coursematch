class CoursesUsersController < ApplicationController
  def create
    @course = Course.find_by(id: params[:item_code])
    
    if params[:type] == 'Now'
      current_user.now(@course)
      flash[:success] = '商品を Want しました。'
    end

    redirect_back(fallback_location: root_path)


  end

  def destroy
  end
end
