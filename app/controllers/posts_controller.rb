class PostsController < ApplicationController
  def index
    @posts = Post.all(order: "created_at desc")

    respond_to do |format|
      format.html
      format.json { render json: @posts }
    end
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.all

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: { post: @post, comments: @comments } }
    end
  end
end
