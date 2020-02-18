class CategoriesController < ApplicationController

  def index
    @parents = Category.all.order("id ASC").limit(13)
    @parent = Category.where(ancestry: nil)
  end

  def show
    @parents = Category.find(params[:id])
    @parent = Category.where(ancestry: nil)
  end

end
