class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @photos = Photo.where(user_id: @user.id)
  end

  def destroy
    current_user = User.find(params[:id])
    current_user.destroy

    redirect_to root
  end
end
