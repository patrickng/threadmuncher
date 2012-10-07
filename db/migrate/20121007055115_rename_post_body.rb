class RenamePostBody < ActiveRecord::Migration
  def change
    change_table :posts do |t|
      t.rename :post_body, :body
    end
  end
end
