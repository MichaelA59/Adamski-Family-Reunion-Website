class Api::V1::UsersController < ApplicationController
  protect_from_forgery unless: -> { request.format.json? }

  def index
    @users = User.all
    render json: @users
  end

  def show
  end

end
