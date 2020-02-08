class ProductsController < ApplicationController
  before_action :set_product

  def show 
    @parents = Category.where(ancestry: nil)
  end

  def new
  end

  def destroy
    product.destroy
    @users = User.all
    if @product.destroy
      render template: "user/:id"
    else
      logger.error e 
      logger.error e.backtrace.join("\n") 
    end
  end
  
  def edit
  end

  private
  def set_product
    @product = Product.find(params[:id])
  end
end
