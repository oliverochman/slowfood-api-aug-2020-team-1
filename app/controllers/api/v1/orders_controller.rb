class Api::V1::OrdersController < ApplicationController
  before_action :authenticate_user!

  def create
    order = Order.create(user: current_user)
    product = Product.find(params[:product])

    order.order_items.create(product: product)

    response = create_order_response(order)

    render json: response
  end

  def update
    order = Order.find(params[:id])
    product = Product.find(params[:product])

    order.order_items.create(product: product)

    response = create_order_response(order)

    render json: response
  end

  private

  def create_order_response(order)
    response = { order: OrderSerializer.new(order) }
    response.merge!(message: "Item has been added to your order" )
  end
end
