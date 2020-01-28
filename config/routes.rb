Rails.application.routes.draw do
  root   'top_page#home'
  get   '/signup',    to: 'users#new'
  post  '/signup',    to: 'users#create'
  get   '/user/edit', to: 'users#edit'
  patch '/user/edit', to: 'users#update'
  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users, only: [:show]
end
