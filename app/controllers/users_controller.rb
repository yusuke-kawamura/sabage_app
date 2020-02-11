class UsersController < ApplicationController
  skip_before_action :logged_in_user, only: [:show, :new, :create]
  
  def show
    @user = User.find(params[:id])
  end
  
  def index
    @users = User.page(params[:page]).per(20)
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
    if current_user.update(user_params)
      redirect_to current_user, success: "プロフィールを更新しました"
    else
      render 'edit'
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation,
                                  :activity_area, :like_weapon, :image)
  end
end
