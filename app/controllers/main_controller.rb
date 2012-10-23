class MainController < ApplicationController
  def index
    @posts = Post.all.sort_by { |post| post.total_votes }.reverse
    session[:referer] = request.env["REQUEST_URI"]
    current_user
  end
end