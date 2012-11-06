class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :header_categories
  helper_method :check_upvote
  helper_method :check_downvote

  def header_categories
    @categories = Category.all
  end

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
end
