Rails.application.routes.draw do
  # devise_for :users
  devise_for :users, controllers: { sessions: 'users/sessions' }

  root "portfolios#index"
  get '/portfolios', to: 'portfolios#index'
  get '/portfolios/list', to: 'portfolios#list'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
