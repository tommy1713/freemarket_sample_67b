class HomesController < ApplicationController
  

  def index
    @parent = Category.where(ancestry: nil)
    @product = Product.includes(@images)
    @images = Image.all
  end


  def new
    @children = Category.find(params[:parent_id]).children
    respond_to do |format|
      format.html
      format.json
    end
  end

end
