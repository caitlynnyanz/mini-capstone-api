class Supplier < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :phone_number, presence: true, uniqueness: true

  has_many :products
  # def products
  #   Product.where(supplier_id: id)
  # end
end
