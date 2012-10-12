class AddNewColumnsForUpvoteDownvote < ActiveRecord::Migration
  def change
    add_column :posts, :upvote, :integer, default: '0'
    add_column :posts, :downvote, :integer, default: '0'
  end
end
