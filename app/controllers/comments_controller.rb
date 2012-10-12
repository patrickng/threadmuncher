class CommentsController < ApplicationController
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
end
