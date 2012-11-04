class StoreController < ApplicationController
  def index
  	@products = Product.order(:title)
    @cart = current_cart

    session_count()
  end

  def session_count
    if session[:counter].nil?
      session[:counter]=1
    else
      session[:counter] +=1
    end
    @counter = session[:counter]
  end
end
