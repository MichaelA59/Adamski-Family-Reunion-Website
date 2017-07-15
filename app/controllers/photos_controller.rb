class PhotosController < ApplicationController

  def index
    @user = current_user
    @users = User.all
    @photos = Photo.all
  end

  def show
    @user = current_user
    @photo = Photo.find(params[:id])
  end

  def new
    @photo = Photo.new
    @user = current_user
  end

  def create
    @user = current_user
    user_id = @user.id
    @photo = Photo.new(photo_params)
    @photo.user_id = @user.id
    if @photo.save
      redirect_to @user
    else
      render :new
    end
  end

  def update
    @user = current_user
    @photo = Photo.find(params[:id])
    if @photo.update(photo_params)
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy

    redirect_to photos_path
  end

  private

  def photo_params
    params.require(:photo).permit(:user_id, { photos: [] })
  end
end
