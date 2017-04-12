class CartsController < ApplicationController

  def update
    binding.pry
  end

  def checkout
    # binding.pry
    current_cart.line_items.each do |line_item|
      line_item.item.inventory -= line_item.quantity
      line_item.item.save
    end
    previous_cart = current_cart
    previous_cart.status = "Submitted"
    previous_cart.save

    current_user.current_cart = nil
    redirect_to previous_cart
  end

end
