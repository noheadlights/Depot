class LineItem < ActiveRecord::Base
  belongs_to :cart
  belongs_to :product 

  attr_accessible :cart_id, :product_id, :price

  def total_price
    product.price * quantity
  end

end
