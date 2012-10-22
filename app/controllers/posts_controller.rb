class PostsController < ApplicationController
  before_filter :require_user, only: [:new, :create]

  def show
    current_user
    @post = Post.find(params[:id])
    @comments = @post.comments.order("created_at desc")
  end

  def new
    @categories = Category.all
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
