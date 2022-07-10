class Supplier < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :phone_number, presence: true, uniqueness: true

  def products
    Product.where(supplier_id: id)
  end
end
