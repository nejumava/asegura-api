Rails.application.routes.draw do
  root 'pins#index'

  devise_for :users
  resource :token, only: [:show]
  resources :pins, only: [:index, :new, :create]

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :pins, only: [:index, :create]
    end
  end
end
