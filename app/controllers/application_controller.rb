class ApplicationController < ActionController::Base
  add_flash_types  :success, :info, :warning, :danger
  
#ログイン関連
  
  #ログインする
  def log_in(user)
    session[:user_id] = user.id
  end
  
  
  
end
