class CreateColumnsUpvotesDownvotesForCommentsTable < ActiveRecord::Migration
  def change
    add_column :comments, :upvote, :integer, default: '0'
    add_column :comments, :downvote, :integer, default: '0'
  end
end
