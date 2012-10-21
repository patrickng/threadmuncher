class RemoveCategoryTable < ActiveRecord::Migration
  def change
    drop_table :category
  end
end
