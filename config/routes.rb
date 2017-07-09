Rails.application.routes.draw do
  root "home#index"

  get '/tab', to: 'tab#index', as: 'tab'

  get '/auth/github', as: :github_login
  get '/auth/github/callback', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
end
