class MainController < ApplicationController
  def index
    @posts = Post.order("created_at desc")
    session[:referer] = request.env["HTTP_REFERER"]
    current_user
  end
end