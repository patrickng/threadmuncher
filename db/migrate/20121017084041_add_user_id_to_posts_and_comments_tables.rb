class AddUserIdToPostsAndCommentsTables < ActiveRecord::Migration
  def change
    add_column :comments, :user_id, :integer, default: "1"
    add_column :posts, :user_id, :integer, default: "1"
  end
end
