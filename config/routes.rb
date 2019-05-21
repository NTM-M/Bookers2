Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books

  resources :users,only:[:show]

  root 'books#top'

  post 'books' => 'books#create'

  get 'home/about' => 'books#about' , as: 'about'

  get 'users/index'

  get 'users/edit'
end
