class MainController < ApplicationController
  before_filter :require_user, only: [:new, :create]
  def index
    @posts = Post.order("created_at desc")
    session[:referer] = request.env["HTTP_REFERER"]
    current_user
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post])
    @post.user = @current_user
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: "Your post was created successfully." }
      else
        format.html { render action: "new", alert: "There was a problem creating your post." }
      end
    end
  end
end