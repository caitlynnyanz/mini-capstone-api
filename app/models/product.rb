class Product < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :description, presence: true, length: { in: 10..500 }

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
