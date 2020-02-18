class ProductsController < ApplicationController
  before_action :set_product, except: [:new, :get_category_children, :get_category_grandchildren, :create]
  before_action :set_parent, only: [:new, :create]
  def show 
    @parents = Category.all.order("id ASC").limit(13)
    @parent = Category.find(params[:id])
  end

  def new
    @product = Product.new
    @product.images.new
  end
 
  def get_category_children
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  def create
    binding.pry
    @product = Product.new(product_params)
    if @product.save!
      redirect_to root_path
    else
      redirect_to new_product_path
    end
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

  private
  def set_product
    @product = Product.find(params[:id])
  end

  def set_parent
    # @parents = Category.all.order("id ASC").limit(13)
    @category_parent_array = ["---"]
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
  end

  def product_params
    params.require(:product).permit(:name, :detail, :category_id, :brand, :status, :postage, :shipping_area, :estimated_date, :price)
  end

end
