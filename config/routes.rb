Rails.application.routes.draw do
  root   'top_page#home'
  get   '/signup',     to: 'users#new'
  post  '/signup',     to: 'users#create'
  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resource   :users,  only: [:edit, :update, :destroy]
  resources  :users,  only: [:show, :index]
end
