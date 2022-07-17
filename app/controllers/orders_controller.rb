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
    carted_products = current_user.carted_products.where(status: "carted")
    
    subtotal = 0
    carted_products.map do |carted_product|
      subtotal += carted_product.quantity * carted_product.product.price
    end

    tax = subtotal * 0.06
    total = subtotal + tax
    order = Order.new(
      user_id: current_user.id,
      subtotal: subtotal,
      tax: tax,
      total: total
    )
    
    if order.save
      carted_products.update_all(status: "purchased", order_id: order.id)
      render json: order.as_json
    else
      render json: { errors: order.errors.full_messages }, status: 422
    end
  end
end
