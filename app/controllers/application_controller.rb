class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :check_session
  
  def check_session
    redirect_to login_login_path if session[:user_id].blank?
  end
end
