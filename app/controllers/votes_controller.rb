class VotesController < ApplicationController
  before_filter :require_user, only: [:create]
  def create
    @post = Post.find(params[:post_id])
    @user_vote = @post.votes.first


    if @user_vote.blank?
      Vote.create(post_id: params[:post_id], user_id: @current_user, vote: params[:vote])
    else
      if @user_vote.vote.to_s == params[:vote].to_s
        @user_vote.destroy
      else
        @user_vote.destroy
        Vote.create(post_id: params[:post_id], user_id: @current_user, vote: params[:vote])
      end
    end

    respond_to do |format|
      format.html { redirect_to post_path, notice: "Thanks for your vote!" }
      format.js { }
    end
  end
end
