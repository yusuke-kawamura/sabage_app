class ApplicationController < ActionController::Base
  add_flash_types  :success, :info, :warning, :danger
  
  helper_method :current_user, :logged_in?
  
#ログイン関連
  #ログインする
  def log_in(user)
    session[:user_id] = user.id
  end
  
  #現在のユーザー
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end
  
  #ログインしているか確認
  def logged_in?
    current_user.present?
  end
  
  #ログアウト
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
