class Api::V1::PhotosController < ApplicationController
  protect_from_forgery unless: -> { request.format.json? }

  def index
    scaled_images = []
    @photos = Photo.all.order('created_at DESC').limit(10)
    @photos.each do |photo|
      scaled_images << photo.photo.versions[:medium].url
    end
    render json: @photos
  end

  def show
    photo = Photo.find(params[:id])
    render json: photo
  end

end
