class MainController < ApplicationController
  def index
    @posts = Post.order("created_at desc")
    session[:referer] = request.env["REQUEST_URI"]
    current_user
  end
end