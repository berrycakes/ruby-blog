Rails.application.routes.draw do
  
  resources :user_payment_methods
  resources :purchases
  get 'home/index'
  devise_for :users
  resources :authors

  patch 'authors/:id/verify', to: 'authors#verify', as: 'verify_author'

  post 'articles/:id/update_gems', to: 'articles#update_gems', as: 'update_gem_article'
  # patch 'authors/:id/verify', to: 'authors#update'

  # get '/articles', to: 'articles#index', as: 'articles'
  # post 'articles', to: 'articles#create'
  # get 'articles/new', to: 'articles#new', as: 'new_article'
  # get 'articles/:id/edit', to: 'articles#edit', as: 'edit_article'
  # get 'articles/:id', to: 'articles#show', as: 'article'
  # patch 'articles/:id', to: 'articles#update'
  # delete 'articles/:id', to: 'articles#destroy'

  resources :articles do 
    resources :comments
  end
  

  root to: 'articles#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get '/articles', to: 'articles#index'
  # get '/articles/:id', to: 'articles#show'
end
