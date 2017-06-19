class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def current_user
  	User.find(session[:user_id]) if session[:user_id]
  end
  def user_authorized
  	redirect_to '/' unless session[:user_id]
  end
  def logged_in
  	redirect_to '/shoes' if session[:user_id]
  end
  helper_method :user_authorized
  helper_method :current_user
  helper_method :logged_in
end
