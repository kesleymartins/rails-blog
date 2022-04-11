Rails.application.routes.draw do
  root 'posts#index'

  get 'user/:id', to: 'user#profile', as: 'user'
  get 'about', to: 'pages#about'

  get 'admin', to: 'admin#index'
  get 'admin/posts', to: 'admin#posts'
  get 'admin/comments', to: 'admin#comments'
  get 'admin/users', to: 'admin#users'
  
  resources :posts do
    resources :comments
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
end
