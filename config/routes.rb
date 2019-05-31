Rails.application.routes.draw do
  root 'posts#index'
  get 'posts/new'
  post 'posts/new',   to: 'posts#create'
  get 'posts/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  
  get      '/login',   to: 'sessions#new'
  post     '/login',   to: 'sessions#create'
  delete   '/logout',  to: 'sessions#destroy'

end
