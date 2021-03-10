class Api::V1::PurchasesController < ApplicationController
  def index
    @purchase = Purchase.order('id')
    render json: @purchase
  end

  def show
    @purchase = Purchase.find(params[:id])
    render json: {status:'SUCCESS', message:'Loaded successfully.', data:@purchase}, status: :ok
  end

  def create
    @purchase = Purchase.new(purchase_params)
    #@purchase.movies = Movie.find(params[:movie_id])
    if @purchase.save
      render json: {status:'SUCCESS', message:'Created user successfully.', data:@purchase}, status: :ok
    else
      render json: {status:'ERROR', message:'Failed to create user.', data:@purchase.errors}, status: :unprocessable_entity
    end
  end

  def destroy
    @purchase = Purchase.find(params[:id])
    @purchase.destroy
    render json: {status:'SUCCESS', message:'Deleted user successfully.', data:@purchase}, status: :ok
  end

  def update
    @purchase = Purchase.find(params[:id])
    if @purchase.update(purchase_params)
      render json: {status:'SUCCESS', message:'Updated user successfully.', data:@purchase}, status: :ok
    else
      render json: {status:'ERROR', message:'Failed to update user.', data:@purchase.errors}, status: :unprocessable_entity
    end
  end

  def get_purchase_for_customer(customer_id)
    @purchase = Purchase.order('id')
    customer_array = Array.new
    @purchase.each do |purchase|
      if purchase[:customer_id] == customer_id
        customer_array << purchase
      end
    end
    return customer_array
  end

  private

  def purchase_params
    params.permit(:customer_id, :movie_id)
  end

end
