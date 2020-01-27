class UsersController < ApplicationController
   before_action :logged_in_user, only: [:edit, :update]
   before_action :correct_user,   only: [:edit, :update]
  
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to @user, success: "登録が完了しました！楽しんでくださいね！"
    else
      render 'new'
    end
  end
  
  def edit
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to @user, success: "プロフィールを更新しました"
    else
      render 'edit'
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation,
                                  :activity_area, :like_weapon, :image)
  end
  
  #ログインしているか確認
  def logged_in_user
    unless logged_in?
      redirect_to login_url, danger: "ログインしてください"
    end
  end
  
  #正しいユーザーか確認
  def correct_user
    @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
  end
end
