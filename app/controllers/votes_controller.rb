class VotesController < ApplicationController
  before_filter :require_user, only: [:create]
  def index
    
  end
  def create
    @post = Post.find(params[:post_id])
    @user_vote = @post.votes.find_by_user_id(@current_user)


    if @user_vote.blank?
      @vote = Vote.new(post_id: params[:post_id], vote: params[:vote])
      @vote.user = @current_user
      @vote.save
    else
      if @user_vote.vote.to_s == params[:vote].to_s
        @user_vote.destroy
      else
        @user_vote.destroy
        @vote = Vote.new(post_id: params[:post_id], vote: params[:vote])
        @vote.user = @current_user
        @vote.save
      end
    end

    respond_to do |format|
      format.html { redirect_to post_path, notice: "Thanks for your vote!" }
      format.js { }
    end
  end
end
