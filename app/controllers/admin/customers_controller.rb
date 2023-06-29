class Admin::CustomersController < ApplicationController
  def edit
    @customer = Customer.find(params[:id])
  end

  private
  def list_params
    params.require(:customer).permit(:title, :body)
  end


end
