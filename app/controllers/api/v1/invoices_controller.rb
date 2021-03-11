class Api::V1::InvoicesController < ApplicationController

  def index
    @invoice = Invoice.order('id')
    render json: @invoice
  end

  def show
    @invoice = Invoice.find(params[:id])
    render json: {status:'SUCCESS', message:'Loaded successfully.', data:@customer}, status: :ok
    
  end

  def create
    @invoice = Invoice.new(invoice_params)
    #get orders for customer
    get_order_for_customer(invoice_params[:customer_id])
  
    byebug
    
    
    #get movie in order
    

    #sum total price

    #sum points for customer
    
    
    if @invoice.save
      render json: {status:'SUCCESS', message:'Created user successfully.', data:@invoice, Orders: @order}, status: :ok
    else
      render json: {status:'ERROR', message:'Failed to create user.', data:@invoice.errors}, status: :unprocessable_entity
    end
   
  end

  

  def get_order_for_customer(customer_id)
 
    @order = Order.find(params[customer_id])
#    @order = Order.order('id')
#    customer_array = Array.new
#    @order.each do |order|
#      if order[:customer_id] == customer_id
#        customer_array << order
#      end
#    end
#    return customer_array
end

  private

  def invoice_params
    params.permit(:order_id, :customer_id, :movie_id, :totalPrice, :totalPoints)
  end

end
