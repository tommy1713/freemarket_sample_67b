class UsersController < ApplicationController
  def index
    # render layout: false 
  end

  def new
  end
  def show

    @user = User.find(params[:id])
    @parent = Category.where(ancestry: nil)

  end


  def destroy
  end

  def logout
    @parent = Category.where(ancestry: nil)
  end


end
