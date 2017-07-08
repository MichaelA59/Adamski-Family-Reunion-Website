class HomeController < ApplicationController

  def index
    @photos = Photo.all.order('created_at DESC').limit(10)
  end

end
