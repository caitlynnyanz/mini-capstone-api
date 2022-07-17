class DefaultBooleanCart < ActiveRecord::Migration[7.0]
  def change
    change_column :carted_products, :status, :boolean, default: false
  end
end
