class CommentsController < ApplicationController
  before_filter :require_user, only: [:create, :upvote, :downvote]

  def create
    @post = Post.find(params[:post_id])
    @post.comments.create(params[:comment])
    redirect_to post_path(@post)
  end

  def upvote
    @comment = Comment.find(params[:id])
    @comment.upvote += 1
    @comment.save
  end

  def downvote
    @comment = Comment.find(params[:id])
    @comment.downvote +=1
    @comment.save
  end

  private
  def require_user
    unless session[:user_id]
      redirect_to login_path, notice: "You must be logged in to post a comment!"
    end
  end
end
