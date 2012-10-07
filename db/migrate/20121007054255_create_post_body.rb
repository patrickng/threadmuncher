class CreatePostBody < ActiveRecord::Migration
  def change
    change_table :posts do |t|
      t.text :post_body
    end
  end
end
