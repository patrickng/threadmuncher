class CreateNewVotesTable < ActiveRecord::Migration
  def change
    create_table :post_votes do |t|
      t.integer :user_id
      t.integer :post_id
      t.boolean :vote_value
    end

    add_index :post_votes, :post_id
    add_index :post_votes, :user_id
    add_index :post_votes, [:post_id, :user_id], unique: "true"
  end
end
