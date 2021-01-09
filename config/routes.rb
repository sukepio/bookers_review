Rails.application.routes.draw do

  get 'book_comments/create'
  get 'book_comments/destroy'
  devise_for :users
  root 'homes#top'
  get 'about' => 'homes#about'
  
  resources :users, only: [:index, :show, :edit, :update, :destroy]
  resources :books do 
    resources :book_comments, only: [:create, :destroy]  
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
