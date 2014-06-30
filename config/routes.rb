Rails.application.routes.draw do
  resources :manufacturers, only: [:index, :new, :create]

  resources :cars, only: [:index, :new, :create]

  root to: 'cars#index'
end
