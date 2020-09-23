class Api::V1::OrdersController < ApplicationController
  before_action :authenticate_user!

  def create
    order = Order.create(user: current_user)
    product = Product.find(params[:product])

    order.order_items.create(product: product)

    render json: { order_id: order.id, message: "Item has been added to your order"}
  end

  def update
    order = Order.find(params[:id])
    product = Product.find(params[:product])

    order.order_items.create(product: product)

    render json: { order_id: order.id, message: "Item has been added to your order"}
  end
end
