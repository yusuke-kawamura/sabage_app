Rails.application.routes.draw do
  root   'top_page#home' 
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
end
