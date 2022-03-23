Rails.application.routes.draw do
  root 'pages#home'

  get 'user/:id', to: 'user#profile', as: 'user'
  get 'about', to: 'pages#about'
  get 'admin', to: 'admin#index'

  resources :posts do
    resources :comments
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
end
