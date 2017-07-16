class HomeController < ApplicationController

  def index
    @all_photos = Photo.all
    @plucked_photos = []
    @all_photos.each do |thing|
      if thing.photos.kind_of?(String)
        @plucked_photos << thing.photos.to_s
      else
        thing.photos.each do |other|
          @plucked_photos << other.versions[:medium].to_s
        end
      end
    end
  end
end
