Rails.application.routes.draw do
  # devise_for :users
  devise_for :users, controllers: { sessions: 'users/sessions' }, path: 'users', path_names: { sign_in: 'login', sign_out: 'logout', registration: 'register', sign_up: 'register' }

  root "portfolios#index"
  get '/portfolios', to: 'portfolios#index'
  get '/portfolios/list', to: 'portfolios#list'
  resources :portfolios
  # resolve('Portfolio') { [:portfolio] }
  # get '/portfolios/new', to: 'portfolios#new'
  # put '/portfolios/create', to: 'portfolios#create'
  # get '/portfolios/edit', to: 'portfolios#edit'
  # post '/portfolios/update', to: 'portfolios#update'
  # delete '/portfolios/destroy', to: 'portfolios#destroy'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
