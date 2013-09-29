class PostsController < ApplicationController
  before_filter :require_user, only: [:new, :create]
  helper_method :check_upvote
  helper_method :check_downvote

  def show
    current_user
    @post = Post.find(params[:id])
    @comment = @post.comments.new

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def new
    @categories = Category.all
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post])
    @post.user = @current_user
    @post.category_id = params[:category][:id]
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: "Your post was created successfully." }
      else
        format.html { render action: "new", alert: "There was a problem creating your post." }
      end
    end
  end
end
