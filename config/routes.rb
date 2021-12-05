Rails.application.routes.draw do
  root :to => "wishlists#index"
  resources :relationships
  resources :gifts
  resources :wishlists
  devise_for :users
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
