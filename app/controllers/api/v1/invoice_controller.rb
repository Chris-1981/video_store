class Api::V1::InvoiceController < ApplicationController

  def index
    @invoice = Invoice.order('id')
    render json: @invoice
  end

  def create
    @invoice = Invoice.new(invoice_params)

    if @invoice.save
      render json: {status:'SUCCESS', message:'Created user successfully.', data:@customer}, status: :ok
    else
      render json: {status:'ERROR', message:'Failed to create user.', data:@customer.errors}, status: :unprocessable_entity
    end
  end

  private

  def invoice_params
    params.permit(:purchase_id, :customer_id, :movie_id, :totalPrice, :totalPoints)
  end

end
