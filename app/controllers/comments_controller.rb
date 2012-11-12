class CommentsController < ApplicationController
  before_filter :require_user, only: [:create]

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(params[:comment])
    @comment.user = @current_user
    respond_to do |format|
      if @comment.save
        format.html { redirect_to post_path(@post) }
      else
        format.html do
          @post = Post.find(params[:post_id])
          @comments = @post.comments.new
          render "posts/show"
        end
      end
    end
  end
end
