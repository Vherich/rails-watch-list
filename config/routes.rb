Rails.application.routes.draw do
  get 'lists/index'
  get 'lists/show'
  get 'lists/new'
  get 'lists/create'
  get 'lists/edit'
  get 'lists/update'
  get 'lists/destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'movies#index'
  resources :movies do
    resources :bookmarks, only: [:new, :create]
  end

  resources :lists do
    resources :bookmarks, only: [:destroy]
  end
end
