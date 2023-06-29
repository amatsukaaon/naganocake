class Public::CustomersController < ApplicationController

  def edit
    @customer = current_customer
  end
  def show
    @customer = current_customer


  end

  def confirm

  end

  def withdraw
    customer = Customer.find(params[:id])
    customer.update(customer_params)
    redirect_to customer_path(list.id)
  end


  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name)
  end


end
