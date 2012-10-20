class RemoveUpvoteAndDownvoteColumnsFromPostsTable < ActiveRecord::Migration
  def change
    remove_column :posts, :upvote
    remove_column :posts, :downvote
  end
end
