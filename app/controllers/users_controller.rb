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
    @recent_voted_posts = @user.votes.order("created_at desc").limit("10").map(&:post).flatten
  end

  def tweet
    @client = Twitter::Client.new(
      consumer_key: "U1UQAdKnAQU2iNeqAZ7sqg",
      consumer_secret: "X1gimnx2rG7WGNDAcMFCjYTliinrkYZo7e6hrTp8iQ",
      oauth_token: "119667769-PqkTXB247kMpeuV9JPgoQyJWq2l3jzVXznmQVSpO",
      oauth_token_secret: "Tdtq5lpJZWM09eSviKFRfoDBgjE4Qs5sI2FlfCdRIo"
    )

    @timeline = @client.user_timeline(@user.twitter_handle, count: "10")
  end
end
