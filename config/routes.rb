Rails.application.routes.draw do
  devise_for :users
  root to: "comics#index"
  resources :comics, only: [:new, :create, :show] do
    collection do
      get 'search'
    end
  end
  resource :box, only: [:new, :create, :destroy, :show]
end
