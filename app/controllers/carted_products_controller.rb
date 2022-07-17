class CartedProductsController < ApplicationController
  before_action :authenticate_user

  def index
    carted_products = current_user.carted_products.where(status: "carted")
    render json: carted_products.as_json
  end

  def show
    carted_product = CartedProduct.find_by(id: params[:id])

    if carted_product.user_id == current_user.id
      render json: carted_product.as_json
    else
      render json: {error: "Please login to view order."}
    end
  end

  def create 
    carted_product = CartedProduct.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity]
    )
    
    if carted_product.save
      render json: carted_product.as_json
    else
      render json: { errors: carted_product.errors.full_messages }, status: 422
    end
  end

  def update
    carted_product_id = params[:id]
    carted_product = CartedProduct.find_by(id: carted_product_id)

    carted_product.product_id = params[:product_id] || product.product_id
    product.quantity = params[:quantity] || product.quantity

    if carted_product.save
      render carted_product.as_json
    else
      render json: { errors: carted_product.errors.full_messages }, status: 422
    end
  end

  def destroy
    carted_product = CartedProduct.find_by(id: params[:id])
    carted_product.status = "removed"

    render json: { message: "Product successfully removed from cart!" }
  end
end
