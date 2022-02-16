Rails.application.routes.draw do
  root 'pages#home'

  get 'user/:id', to: 'user#profile', as: 'user'
  get 'about', to: 'pages#about'

  resources :posts

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
end
