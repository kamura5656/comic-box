Rails.application.routes.draw do
  devise_for :users
  root to: "comics#index"
  resources :comics, only: [:new, :create, :show]
  resource :box, only: [:new, :create, :destroy, :show]
end
