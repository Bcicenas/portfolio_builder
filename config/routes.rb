Rails.application.routes.draw do
  # devise_for :users
  devise_for :users, controllers: { sessions: 'users/sessions' }, path: '/', path_names: { sign_in: 'login', sign_out: 'logout' }

  root "portfolios#index"
  get '/portfolios', to: 'portfolios#list'
  get '/portfolios/list', to: 'portfolios#list'
  get '/templates', to: 'templates#list'
  get '/templates/list', to: 'templates#list'
  post '/portfolios/change_default_portfolio', to: 'portfolios#change_default_portfolio'

  resources :portfolios
  resources :templates

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
