Rails.application.routes.draw do

  root'home#index'

  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }

  resources :users
  resources :photos

  namespace :api do
    namespace :v1 do
      resources :photos
    end
  end

end
