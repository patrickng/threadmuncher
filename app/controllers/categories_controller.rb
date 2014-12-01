class CategoriesController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create]

  def index
    @categories = Category.all
  end

  def show
    current_user
    @category = Category.find(params[:id])
    @category_posts = @category.posts.order("created_at desc")
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params[:category])
    respond_to do |format|
      if @category.save
        format.html { redirect_to new_post_path, notice: "You have created a new category successfully." }
      else
        format.html { render action: "new", alert: "There was a problem creating a new category." }
      end
    end
  end
end
