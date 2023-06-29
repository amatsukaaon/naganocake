class Public::CartItemsController < ApplicationController
  def index
  end


   def create
      binding.pry
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customers_id = customers_user.id
    @cart_item.save
    redirect_to customer_registration_path
   end

  private
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end
 private


end