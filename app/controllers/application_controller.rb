class ApplicationController < ActionController::Base
  skip_before_action :logged_in_user, only: [:new, :create, :show], raise: false
  add_flash_types  :success, :info, :warning, :danger
  helper_method :current_user, :logged_in?, :current_user?
  
#ログイン関連
  #ログインする
  def log_in(user)
    session[:user_id] = user.id
  end
  
  #永続的にログインする
  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end
  
  #永続的なログインを破棄する
  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end
  
  # #現在のユーザー(永続的か一時的なログインか確認し返す)
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    elsif cookies.signed[:user_id]
      user = User.find_by(id: cookies.signed[:user_id])
      if user&.authenticated?(cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end
  
  #ログインしているか確認
  def logged_in?
    current_user.present?
  end
  
  #ログアウト
  def log_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end
  
  #ログイン済みのユーザーか確認する
  def current_user?(user)
    user == current_user
  end
end
