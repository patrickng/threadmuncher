class RenameSymbolTypeConflict < ActiveRecord::Migration
  def change
    change_table :posts do |t|
      t.rename :type, :type_of_post
    end
  end
end
