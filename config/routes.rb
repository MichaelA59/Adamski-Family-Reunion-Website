Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  root'home#index'

  resources :users, only: [:index, :show, :edit, :update, :destroy]
  resources :photos
end
