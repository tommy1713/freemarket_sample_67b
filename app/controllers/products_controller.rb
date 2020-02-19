class ProductsController < ApplicationController

  before_action :set_product, except: [:new, :get_category_children, :get_category_grandchildren, :create]
  before_action :set_parent, only: [:new, :create, :edit, :update]

  def show 
    @parents = Category.all.order("id ASC").limit(13)
    @parent = Category.where(ancestry: nil)
    @comment = Comment.new
    @comments = @product.comments.includes(:user)
  end

  def new
    @product = Product.new
    @product.images.build
  end
 
  def get_category_children
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  def create
    @product = Product.new(product_params)
    if @product.save!
      redirect_to root_path
    else
      render '/products/new'
    end
  end

  def destroy
    @product.destroy
    @users = User.all
    if @product.destroy
      redirect_to root_path
    else
      logger.error e 
      logger.error e.backtrace.join("\n") 
    end
  end
  
  def edit
     # productに紐づいていいる孫カテゴリーの親である子カテゴリが属している子カテゴリーの一覧を配列で取得
    @category_child_array = @product.category.parent.parent.children
     # productに紐づいていいる孫カテゴリーが属している孫カテゴリーの一覧を配列で取得
    @category_grandchild_array = @product.category.parent.children
  end

  def update
    @product.update(product_params)
    redirect_to product_path(params[:id])
  end

  private
  def set_product
    @product = Product.find(params[:id])
  end


  def set_parent
    @category_parent_array = Category.where(ancestry: nil).pluck(:name)
  end

  
  def product_params
    params.require(:product).permit(:name, :detail, :category_id, :brand, :size, :price, :status, :shipping_area, :estimated_date, :postage, images_attributes: [:image]).merge(user_id: current_user.id)
  end
end
