class ProductsController < ApplicationController
  before_action :authenticate_admin, except: [:index, :show]

  def index
    @products = Product.all

    if params[:category]
      category = Category.find_by(name: params[:category])
      @products = category.products
    end
  
    render template: "products/index"
  end

  def show
    @product = Product.find_by(id: params[:id])
    render template: "products/show"
  end

  def create
    product = Product.new(
      name: params[:name],
      price: params[:price],
      description: params[:description],
      supplier_id: params[:supplier_id]
    )
    @product = product
    if product.save
      render template: "products/show"
    else
      render json: { errors: product.errors.full_messages }, status: 422
    end
  end

  def update
    product_id = params[:id]
    product = Product.find_by(id: product_id)

    product.name = params[:name] || product.name
    product.price = params[:price] || product.price
    product.description = params[:description] || product.description
    product.supplier_id = params[:supplier_id] || product.supplier_id

    @product = product
    if product.save
      render template: "products/show"
    else
      render json: { errors: product.errors.full_messages }, status: 422
    end
  end

  def destroy
    product_id = params[:id]
    product = Product.find_by(id: product_id)
    product.destroy

    render json: { message: "Product successfully deleted!" }
  end
end




### Decompostion of Shopping Cart

#create model Carted_Product user_id:integer product_id:integer quantity:integer order_id:integer status:boolean / rails db:migrate
##status : boolean (true = carted, false = purchased, nil = removed)
#create carted_products controller
#relating tables
#update order controller
#creating routes
#index, show, create, update, delete (remove)





