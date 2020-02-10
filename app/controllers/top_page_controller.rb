class TopPageController < ApplicationController
  skip_before_action :logged_in_user
  skip_before_action :group_user
  
  def home
  end
end
