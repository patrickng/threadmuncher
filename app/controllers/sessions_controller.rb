class SessionsController < ApplicationController
  def new

  end
  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      session_redirect = session[:referer]
      session[:referer] = nil
      redirect_to session_redirect, notice: "Successfully logged in!"
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
end
