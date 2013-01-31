class CreateItemstables < ActiveRecord::Migration
  def change
    create_table :itemstables do |t|
      t.integer :quantity
      t.decimal :price_per_line

      t.timestamps
    end
  end
end
