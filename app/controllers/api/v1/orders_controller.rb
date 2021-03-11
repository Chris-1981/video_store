class Api::V1::OrdersController < ApplicationController
  def index
    @order = Order.order('id')
    customer_order = the_customer_order(1)
    render json: {status:'SUCCESS', message:'Loaded successfully.', data:@order, customer:customer_order}, status: :ok
  end

  def show
    @order = Order.find(params[:id])
    render json: {status:'SUCCESS', message:'Loaded successfully.', data:@order}, status: :ok
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      render json: {status:'SUCCESS', message:'Created user successfully.', data:@order}, status: :ok
    else
      render json: {status:'ERROR', message:'Failed to create user.', data:@order.errors}, status: :unprocessable_entity
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    render json: {status:'SUCCESS', message:'Deleted user successfully.', data:@order}, status: :ok
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order)
      render json: {status:'SUCCESS', message:'Updated user successfully.', data:@order}, status: :ok
    else
      render json: {status:'ERROR', message:'Failed to update user.', data:@order.errors}, status: :unprocessable_entity
    end
  end

  def the_customer_order(customer_id)
    @order = Order.order('id')
    @customer_order = Array.new
    @order.each do |order|
      if order[:customer_id] == customer_id
        @customer_order << order
      end
    end
    return @customer_order
  end

  

  private

  def order_params
    params.permit(:customer_id, :movie_id, :total_price)
  end

end
