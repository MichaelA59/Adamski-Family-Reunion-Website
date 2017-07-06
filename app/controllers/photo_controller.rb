class PhotoController < ApplicationController

  def index
    @user = current_user
    @photos = Photo.all.order('created_at DESC')
  end

  def show
    @user = current_user
    @photo = Photo.find(params[:id])
  end

  def new
    @photo = Photo.new
  end

  def create
    @user = current_user
    @photo = Photo.new(photo_params)
    if @photo.save
      redirect_to @user
    else
      render :new
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy

    redirect_to photos_path
  end

  private

  def photos_params
    params.require(:photo).permit(:photo)
  end
end
