class RemovePostVotesTableAndCommentsUpvoteAndDownvoteColumns < ActiveRecord::Migration
  def change
    remove_column :comments, :upvote
    remove_column :comments, :downvote

    drop_table :post_votes
  end
end
