class HomesController < ApplicationController
  

  def index
    @product = Product.all
  end

  def product_params・
    params.require(:product).permit(:name, :price,:images)
  end
  
end
