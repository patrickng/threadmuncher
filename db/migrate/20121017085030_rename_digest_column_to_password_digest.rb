class RenameDigestColumnToPasswordDigest < ActiveRecord::Migration
  def change
    rename_column :users, :digest, :password_digest
  end
end
