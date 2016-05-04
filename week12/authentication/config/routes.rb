Rails.application.routes.draw do
  resources :users

  get '/signup', to: 'users#new'
  get '/users/:id/login', to: 'users#login'
  post '/users/:id/', to: 'users#authenticate'
end
