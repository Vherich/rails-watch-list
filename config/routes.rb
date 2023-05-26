Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'lists#index'
  resources :movies do
    resources :bookmarks, only: [:new, :create]
  end

  resources :lists do
    resources :bookmarks, only: [:destroy]
  end

  resources :bookmarks, only: [:destroy]
end
