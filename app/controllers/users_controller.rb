class UsersController < ApplicationController
  before_filter :authenticate_user!, only: [:edit, :update]
  
#   def new
#     @user = User.new
#   end

#   def create
#     @user = User.new(params.require(:user).permit(:email, :password, :password_confirmation, :handle))
#     if @user.save
#       redirect_to root_url, notice: "Sign up successful!"
#     else
#       render "new"
#     end
#   end

  def show
    current_user
    @user = User.find_by_handle(params[:handle])
    @recent_posts = @user.posts.order("created_at desc").limit("10")
    @recent_comments = @user.comments.order("created_at desc").limit("10")
    @recent_voted_posts = @user.votes.order("created_at desc").limit("10").map(&:post)

    # @client = Twitter::Client.new(
    #   consumer_key: "U1UQAdKnAQU2iNeqAZ7sqg",
    #   consumer_secret: "X1gimnx2rG7WGNDAcMFCjYTliinrkYZo7e6hrTp8iQ",
    #   oauth_token: "119667769-PqkTXB247kMpeuV9JPgoQyJWq2l3jzVXznmQVSpO",
    #   oauth_token_secret: "Tdtq5lpJZWM09eSviKFRfoDBgjE4Qs5sI2FlfCdRIo"
    # )
  end

#   def edit
#     @user = User.find_by_handle(params[:handle])
#   end

#   def update
#     @user = User.find_by_handle(params[:handle])
#     if @user.update_attributes(params[:user])
#       redirect_to user_profile_path, notice: "You have updated your profile!"
#     else
#       render 'edit'
#     end
#   end
end
