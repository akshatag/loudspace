class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  
  helper_method def signed_in?
  	session[:user_id]
  end

  helper_method def current_user
  	@user = User.find(session[:user_id]) if signed_in? 
  end

end
