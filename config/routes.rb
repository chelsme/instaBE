Rails.application.routes.draw do
  resources :posts
  resources :users
  resources :likes
  resources :comments
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post 'login', to: 'application#login'
  # to: chooses the controller to use and the method

  post 'users/:id', to: 'application#updateuser'
end
