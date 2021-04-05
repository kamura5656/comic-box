Rails.application.routes.draw do
  devise_for :users
  root to: 'comics#index'
  resources :comics, only: %i[new create show] do
    collection do
      get 'search'
    end
  end
  resources :boxes, only: %i[new create destroy show update] do
    collection do
      get 'search'
    end
  end
end
