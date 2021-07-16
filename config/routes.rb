Rails.application.routes.draw do
  devise_for :users
  root to: "reviews#index"
  resources :reviews, only: [:index, :new, :create, :show, :destroy]
end
