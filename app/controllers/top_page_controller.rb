class TopPageController < ApplicationController
  skip_before_action :logged_in_user
  
  def home
  end
end
