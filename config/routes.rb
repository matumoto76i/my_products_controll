Rails.application.routes.draw do
  devise_for :users

  root to: 'posts#index'
  
  resources :posts, only: [:index]
  resources :users, only: [:index, :show]
  resources :items do
    resources :comments, only: [:create]
    collection do
      get 'get_category_children', defaults: { domat: 'json'}
      get 'get_category_grandchildren', defaults: { fomat: 'json'}
    end
  end
end