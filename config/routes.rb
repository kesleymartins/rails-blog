Rails.application.routes.draw do
  devise_for :users
  resources :posts
  root 'pages#home'

  get 'about', to: 'pages#about'
end
