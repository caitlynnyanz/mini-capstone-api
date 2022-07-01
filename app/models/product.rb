class Product < ApplicationRecord
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
