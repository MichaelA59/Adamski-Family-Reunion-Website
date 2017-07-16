class Api::V1::PhotosController < ApplicationController
  protect_from_forgery unless: -> { request.format.json? }

  def index
    scaled_images = []
    @photos = Photo.all
    @photos.each do |photo|
      photo.photos.each do |img|
        scaled_images << img.to_s
      end
    end
    render json: @photos
  end

  def show
    photo = Photo.find(params[:id])
    render json: photo
  end

end
