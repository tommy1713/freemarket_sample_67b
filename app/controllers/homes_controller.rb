class HomesController < ApplicationController
  

  def index
    @product = Product.all
    @image = Image.all
    @parent = Category.where(ancestry: nil)
  end


  def new
    @children = Category.find(params[:parent_id]).children
    respond_to do |format|
      format.html
      format.json
    end
  end

end
