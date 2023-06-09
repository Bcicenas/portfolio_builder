Rails.application.routes.draw do
  root "portfolios#index"
  get '/portfolios', to: 'portfolios#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
