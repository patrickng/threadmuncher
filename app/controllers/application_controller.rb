class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :header_categories
  before_filter :configure_permitted_parameters, if: :devise_controller?
  helper_method :check_upvote
  helper_method :check_downvote

  def header_categories
    @categories = Category.all
  end

  private

  def require_user
    unless current_user
      respond_to do |format|
        format.html { redirect_to login_path, alert: "You'll need to login to do that!" }
        format.js { render "sessions/new" }
      end
    end
  end

  def check_upvote(post)
    post.votes.where("user_id = ? AND vote = 't' ", @current_user).blank?
  end

  def check_downvote(post)
    post.votes.where("user_id = ? AND vote = 'f' ", @current_user).blank?
  end

  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:email, :password, :password_confirmation, :handle)
    end
  end
end
