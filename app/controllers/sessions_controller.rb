class SessionsController < ApplicationController
  skip_before_action :logged_in_user
  skip_before_action :group_user
  
  def new
  end
  
  def create
    user = User.find_by(name: params[:session][:name])
    if user&.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to user
    else
      flash.now[:danger] = 'ユーザー名とパスワードの組み合わせが正しくありません'
      render 'new'
    end
  end
  
  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
