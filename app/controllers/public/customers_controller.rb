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
    customer = current_customer
    customer.update(is_deleted: true)
    redirect_to root_path
  end


  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name)
  end


end
