class OrdersController < ApplicationController
  before_action :authenticate_user

  def index
    orders = current_user.orders

    render json: orders.as_json
  end

  def show
    order = Order.find_by(id: params[:id])

    if order.user_id == current_user.id
      render json: order.as_json
    else
      render json: {error: "Please login to view order."}
    end
  end
  
  def create
    product = Product.find_by(id: params[:product_id])
    quantity = params[:quantity].to_i
    subtotal = product.price * quantity
    tax = subtotal * 0.06
    total = subtotal + tax

    order = Order.create!(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: quantity,
      subtotal: subtotal,
      tax: tax,
      total: total
    )
    
    render json: order.as_json
  end
end
