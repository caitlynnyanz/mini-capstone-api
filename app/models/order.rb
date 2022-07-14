class Order < ApplicationRecord
  belongs_to :product
  belongs_to :user
end





## Decomposing product purch

#user sends product_id and quantity (frontend)
#backend assings user_id to order
#subtotal function calculate based on quantity
#tax and total fun from there
#returns order to frontend