Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'

  resources :items do
    resources :purchases, only: [:new, :index, :create]
  end
end
