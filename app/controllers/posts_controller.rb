class PostsController < ApplicationController
  before_filter :find_post, only: [:show, :upvote, :downvote]
  before_filter :require_user, only: [:new, :create, :upvote, :downvote]

  def index
    @posts = Post.all(order: "created_at desc")
    current_user
  end

  def show
    @comments = @post.comments.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post])

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: "Your post was created successfully." }
      else
        format.html { render action: "new", alert: "There was a problem creating your post." }
      end
    end
  end

  def upvote
    @post.upvote += 1
    @post.save
  end

  def downvote
    @post.downvote += 1
    @post.save
  end

  def find_post
    @post = Post.find(params[:id])
  end

  private
  def require_user
    unless session[:user_id]
      redirect_to login_path, notice: "You must be logged in to make a post!"
    end
  end
end
