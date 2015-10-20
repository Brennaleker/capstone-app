Rails.application.routes.draw do
  root 'home#index'

  get '/profile', to: 'home#profile', as: 'profile'
  get '/login', to: 'home#login', as: 'login'
  get '/signup', to: 'home#signup', as: 'signup'
  post '/users', to: 'home#new_user', as: 'new_user'
  get '/about', to: 'home#about', as: 'about'
end
