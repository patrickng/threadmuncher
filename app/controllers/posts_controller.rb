class PostsController < ApplicationController
  before_filter :find_post, only: [:show, :upvote, :downvote]

  def index
    @posts = Post.all(order: "created_at desc")
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
end
