Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :lectures do
    resources :registrations, only: [:new, :create, :index]
  end
end
