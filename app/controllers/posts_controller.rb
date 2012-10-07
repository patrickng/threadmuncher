class PostsController < ApplicationController
  def index
    @posts = Post.all(order: "created_at desc")
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post])

    respond_to do |format|
      if @post.save
        redirect_to @post
      else
        render action: "new"
      end
    end
  end
end
