class CreateTypeOfPost < ActiveRecord::Migration
  def change
    change_table :posts do |t|
      t.integer :type
    end
  end
end
