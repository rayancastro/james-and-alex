Rails.application.routes.draw do
  devise_for :users
  root to: 'lectures#index'

  resources :lectures do
    resources :bookings, only: [:new, :create, :index]
  end
  resources :bookings, only: [:destroy]
end
