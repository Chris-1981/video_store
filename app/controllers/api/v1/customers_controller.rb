class Api::V1::CustomersController < ApplicationController
  def index
    @customer = Customer.order('id')
    render json: @customer
  end

  def show
    @customer = Customer.find(params[:id])
    render json: {status:'SUCCESS', message:'Loaded successfully.', data:@customer, Movie: @movie}, status: :ok
  end

  def create
    @customer = Customer.new(user_params)
    if @customer.save
      render json: {status:'SUCCESS', message:'Created user successfully.', data:@customer}, status: :ok
    else
      render json: {status:'ERROR', message:'Failed to create user.', data:@customer.errors}, status: :unprocessable_entity
    end
  end

  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    render json: {status:'SUCCESS', message:'Deleted user successfully.', data:@customer}, status: :ok
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(user_params)
      render json: {status:'SUCCESS', message:'Updated user successfully.', data:@customer}, status: :ok
    else
      render json: {status:'ERROR', message:'Failed to update user.', data:@customer.errors}, status: :unprocessable_entity
    end

  end

  private

  def user_params
    params.permit(:name, :email, :points)
  end
end
