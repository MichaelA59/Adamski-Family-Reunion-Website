class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @photos = Photo.where(user_id: @user.id)
    @current_user = current_user
    @complete_profile = false
    if @current_user.first_name.nil? || @current_user.last_name.nil? ||
      @current_user.mother.nil? || @current_user.father.nil? || @current_user.city.nil? ||
      @current_user.state.nil? || @current_user.phone_number.nil? ||
      @current_user.address.nil?
      @complete_profile = false
    else
      @complete_profile = true
    end
  end

  def edit
    @user = current_user
  end

  def destroy
    current_user = User.find(params[:id])
    current_user.destroy

    redirect_to root
  end
end
