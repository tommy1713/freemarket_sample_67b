class ProductsController < ApplicationController, with: :render_404

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
    def render_404(e = nil)
      if e
        logger.error e 
        logger.error e.backtrace.join("\n") 
      end
      render template: 'errors/error404', status: 404, layout: 'application', content_type: 'text/html'
    end
  end

  private
  def set_product
    @product = Product.find(params[:id])
  end
end
