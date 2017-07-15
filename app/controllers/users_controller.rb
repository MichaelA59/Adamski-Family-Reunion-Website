class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @photos = Photo.where(user_id: @user.id)
    @current_user = current_user
    if
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
    @mother = User::MOTHER
    @father = User::FATHER
    @state = User::STATE
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    current_user = User.find(params[:id])
    current_user.destroy

    redirect_to root
  end

  private

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :name,
      :email,
      :image,
      :mother,
      :father,
      :city,
      :state,
      :phone_number,
      :address
    )
  end
end
