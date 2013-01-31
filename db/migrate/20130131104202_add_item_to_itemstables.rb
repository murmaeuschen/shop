class AddItemToItemstables < ActiveRecord::Migration
  def change
    add_column :itemstables, :item, :references
  end
end
