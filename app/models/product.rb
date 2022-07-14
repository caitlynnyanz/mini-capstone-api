class Product < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :description, presence: true, length: { in: 10..500 }

  belongs_to :supplier
  has_many :images
  has_many :orders
  # def supplier
  #   Supplier.find_by(id: supplier_id)
  # end

  def friendly_created_at
    created_at.strftime("%B %e, %Y")
  end

  def is_discounted?
    if price > 10
      return false
    elsif price < 10
      return true
    end
  end

  def tax
    price * 0.06
  end

  def total
    price + tax
  end
end
