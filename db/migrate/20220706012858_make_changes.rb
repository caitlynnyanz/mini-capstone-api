class MakeChanges < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :in_stock, :boolean, default: true
    add_column :products, :inventory_count, :integer
  end
end
