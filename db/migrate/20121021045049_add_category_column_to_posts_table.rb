class AddCategoryColumnToPostsTable < ActiveRecord::Migration
  def change
    add_column :posts, :category_id, :integer, default: "1"
  end
end
