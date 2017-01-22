Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  concern :commentable do
    resources :comments
  end

  resources :users
  resources :posts, shallow: true do
    resources :comments, except: [:index, :new, :edit, :show]
  end

  root 'posts#index'

end
