class ProductsController < ApplicationController
  before_action :set_product

  def show 
    @parents = Category.where(ancestry: nil)
  end

  def new
    @product = Product.new
    @category_parent_array = ["---"]
    Category.where(ancestry: nil).each do |parent|
       @category_parent_array << parent.name
    end
  end
 
  def get_category_children
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

 
  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
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

  def update
    @product.update(product_params)
  end

  private
  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.permit(:name, :detail, :category, :brand, :size, :prise, :status, :shipping_area, :estimated_date, :postage, :situation, :favorite, :image, :stock)
  end

end
