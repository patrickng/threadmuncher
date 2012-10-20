class ApplicationController < ActionController::Base
  protect_from_forgery

  private
  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
      @current_user_handle = @current_user.handle
    end
  end

  def require_user
    unless current_user
      session[:referer] = request.env["HTTP_REFERER"]
      respond_to do |format|
        format.html { redirect_to login_path, notice: "You'll need to login to do that!" }
        format.js { render partial: "users/form" }
      end
    end
  end
end
