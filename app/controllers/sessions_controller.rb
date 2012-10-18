class SessionsController < ApplicationController
  after_filter :clear_session_referer, only: [:create]
  def new

  end
  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to session[:referer], notice: "Successfully logged in!"
    else
      flash[:alert] = "Invalid email or password"
      render "new"
    end
  end
  def destroy
    session[:user_id] = nil
    session[:referer] = nil
    redirect_to root_url, notice: "Successfully logged out."
  end
  def clear_session_referer
    session[:referer] = nil
  end
end
