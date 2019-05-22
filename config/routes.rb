Rails.application.routes.draw do
  root 'books#top'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books

  resources :users, only:[:show, :index, :edit,:update]

  post 'books' => 'books#create'


  get 'home/about' => 'books#about' , as: 'about'

  delete 'users/:id' => 'users#destroy'
end
