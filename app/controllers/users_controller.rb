class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:show,:edit1,:edit2,:edit]
  before_action :correct_user, only:[:destroy,:upadate]
  
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
    if validate_password && @user.update(user_params)
      flash[:success] = 'プロフィールが正常に更新されました'
      redirect_to @user
    else
      flash.now[:danger] = 'プロフィールは更新されませんでした'
      render :edit1
    end
    
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def edit1
    @user = User.find(params[:id])
  end
  
  def edit2
    @user = User.find(params[:id])
  end
    
  
  private

  def user_params
    params.require(:user).permit(:name, :location, :password, :password_confirmation,{:course_ids => []})
  end
  
  def validate_password
    unless @user.authenticate(params[:password_for_validation])
      @user.errors.add(:password, 'パスワードが一致しませんでした')
      return false
    end
    true
  end
  
  def correct_user
    @user = User.find_by(id: params[:id])
    if (@user && current_user.try!(:admin)) || (@user && (@user.name == current_user.try!(:name)))
    else
      redirect_to root_url
    end
  end
end
