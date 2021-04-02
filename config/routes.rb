Rails.application.routes.draw do
  devise_for :users
  root to: "comics#index"
  resources :comics, only: [:new, :create, :show] do
    collection do
      get 'search'
    end
  end
  # get 'boxes/index'
  resources :boxes, only: [:new, :create, :destroy, :show, :update] do
    collection do
      get 'search'
    end
  end
end
