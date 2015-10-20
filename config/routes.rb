Rails.application.routes.draw do
  root 'home#index'

  get '/profile', to: 'home#profile', as: 'profile'

  get '/login', to: 'home#login', as: 'login'
end
