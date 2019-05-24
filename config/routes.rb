Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books

  resources :users, only:[:show, :index, :edit, :update, :create]

  root 'books#top'

  get 'home/about' => 'books#about' , as: 'about'
end
