class UsersController < ApplicationController
  
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
    @user = current_user
  end

  def update
    @user = current_user
    if current_user.update(user_params)
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
end
