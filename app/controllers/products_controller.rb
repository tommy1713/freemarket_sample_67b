class ProductsController < ApplicationController, with: :render_404
  before_action :set_product

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
    if @product.destroy
      render template: "user/:id"
    else
      logger.error e 
      logger.error e.backtrace.join("\n") 
    end
  end

  private
  def set_product
    @product = Product.find(params[:id])
  end
end
