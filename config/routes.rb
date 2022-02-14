Rails.application.routes.draw do
  resources :posts
  root 'pages#home'

  get 'about', to: 'pages#about'
end
