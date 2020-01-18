Rails.application.routes.draw do
  root   'top_page#home'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  resources :users, only: [ :show, :edit, :update]
end
