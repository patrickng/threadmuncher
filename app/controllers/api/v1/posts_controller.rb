class Api::V1::PostsController < ApplicationController
  respond_to :json

  def index
    @posts = Post.all
    render json: @posts
  end

  def show
    current_user
    @post = Post.includes(:comments).find(params[:id])
    render json: @post
  end

  def new
    @categories = Category.all
    @post = Post.new

    render json: @post
  end

  def create
    @post = Post.new(params[:post])
    @post.user = current_user
    @post.category_id = params[:category][:id]
    respond_to do |format|
      if @post.save
        format.json { render json: @post, status: :created, location: @post }
      else
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end
end