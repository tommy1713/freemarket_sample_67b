class ProductsController < ApplicationController

  def show 
    @product = Product.find(params[:id])
    @parents = Category.where(ancestry: nil)
  end

  def new
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
    @users = User.all
  end
end
