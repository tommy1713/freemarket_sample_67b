class UsersController < ApplicationController
  def index
    # render layout: false 
  end

  def new
  end
  def show
    # @user = User.find(params[:id])
    @parents = Category.where(ancestry: nil)
  end

  def destroy
  end

  def logout
    @parents = Category.where(ancestry: nil)
  end


end
