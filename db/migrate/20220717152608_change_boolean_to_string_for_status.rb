class ChangeBooleanToStringForStatus < ActiveRecord::Migration[7.0]
  def change
    change_column :carted_products, :status, :string
  end
end
