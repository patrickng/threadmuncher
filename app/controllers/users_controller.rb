class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to root_url, notice: "Sign up successful!"
    else
      render "new"
    end
  end

  def show
    @user = User.find_by_handle(params[:handle])
    @recent_posts = @user.posts.order("created_at desc").limit("10")
    @recent_comments = @user.comments.order("created_at desc").limit("10")
    @recent_voted_posts = @user.votes.order("created_at desc").limit("10").collect(&:post)
  end
end
