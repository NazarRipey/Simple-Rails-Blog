Rails.application.routes.draw do

  get 'welcome/index'

  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :articles do
    resources :comments
  end

  root 'welcome#index'
  
end
