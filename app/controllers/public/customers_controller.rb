class Public::CustomersController < ApplicationController

  def edit
    @customer = current_customer
  end
  def show
    @customer = current_customer


  end

  def confirm

  end



  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name)
  end


end
