class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:show,:edit]
  
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    flash[:success] = '退会しました'
    redirect_to root_url
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = 'プロフィールが正常に更新されました'
      redirect_to @user
    else
      flash.now[:danger] = 'プロフィールは更新されませんでした'
      render :edit
    end
    
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :location, :password, :password_confirmation,{:course_ids => []})
  end
  
end
