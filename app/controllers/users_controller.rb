class UsersController < ApplicationController
  def index
    # render layout: false 
  end

  def new
  end
  def show
    @parents = Category.where(ancestry: nil)
  end


  def destroy
  end


end
