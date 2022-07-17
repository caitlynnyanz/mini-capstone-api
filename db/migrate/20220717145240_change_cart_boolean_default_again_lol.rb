class ChangeCartBooleanDefaultAgainLol < ActiveRecord::Migration[7.0]
  def change
    change_column :carted_products, :status, :boolean, default: true
  end
end
