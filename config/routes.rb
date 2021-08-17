Rails.application.routes.draw do
  devise_for :users
  root to: "reviews#index"
  resources :reviews do
    collection do
      get 'search'
    end
    resources :comments, only: [:create, :destroy]
    resources :likes,    only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update]
end
