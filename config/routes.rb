HackerClone2::Application.routes.draw do
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :users
  resources :posts
  resources :sessions
  resources :votes
  resources :comments

  root :to => 'posts#index'


end
