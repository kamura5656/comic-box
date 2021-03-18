Rails.application.routes.draw do
  devise_for :users
  root to: "comics#index"
  resource :comics, only: [:new, :create]
end
