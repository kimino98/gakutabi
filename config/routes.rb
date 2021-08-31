Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
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
