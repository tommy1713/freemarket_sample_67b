class HomesController < ApplicationController
  

  def index
    @product = Product.all
    @image = Image.all
  end

  
end
