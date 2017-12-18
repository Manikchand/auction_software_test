class LoginController < ApplicationController
skip_before_action :check_session
  def sign_out
  	reset_session
	redirect_to root_url
  end

  def login
  	if session[:user_id].present?
  		@user = User.find_by_id(session[:user_id])
	  	if @user.present?
	  		session[:user_id] = @user.try("id")
	  		redirect_to products_path
	  	else
			redirect_to root_url
	  	end  		
  	end
  end

  def log_in
  	if params[:user_name].present? && params[:password].present?
	  	user_name = params[:user_name]
	  	salt_password = Digest::MD5.hexdigest(params[:password])
	  	@user = User.find_by_user_name_and_salt_password(user_name,salt_password)
	  	if @user.present?
	  		session[:user_id] = @user.try("id")
	  		redirect_to products_path
	  	else
				redirect_to root_url
	  	end
	else
		redirect_to root_url
    end
  end
end
