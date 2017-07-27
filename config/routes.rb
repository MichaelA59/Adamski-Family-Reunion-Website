Rails.application.routes.draw do

  root'home#index'

  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks"}

  authenticate :user do
    resources :photos, only: [:new]
  end

  resources :users
  resources :photos
  resources :tips, only: [:index]

  namespace :api do
    namespace :v1 do
      resources :photos
      resources :users
    end
  end

end
