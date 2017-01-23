Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  concern :commentable do
    resources :comments
  end

  resources :users
  resources :posts do
    resources :comments, only: [:create, :edit, :update, :destroy]
  end

  root 'posts#index'

end
