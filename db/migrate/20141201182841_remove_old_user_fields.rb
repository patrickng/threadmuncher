class RemoveOldUserFields < ActiveRecord::Migration
  def change
    remove_column :users, :twitter_handle
    remove_column :users, :password
    remove_column :users, :password_digest
  end
end
