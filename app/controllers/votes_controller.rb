class VotesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @post.votes.create(params[:vote])
    redirect_to :back
  end
end
