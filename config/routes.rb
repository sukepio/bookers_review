Rails.application.routes.draw do

  devise_for :users
  root 'homes#top'
  get 'about' => 'homes#about'
  get 'search' => 'searches#search'

  resources :users, only: [:index, :show, :edit, :update, :destroy] do
    member do
      get :followings, :followers
    end
  end
  
  resources :books do 
    resource :likes, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]  
  end
  
  post 'follow/:id' => 'relationships#follow', as: 'follow'
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
