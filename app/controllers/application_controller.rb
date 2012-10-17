class ApplicationController < ActionController::Base
  protect_from_forgery
 
  private
  def current_user
    @current_user ||= User.find(session[:user_id]).handle if session[:user_id]
  end
end
