Rails.application.routes.draw do
  resources :channels
  resources :posts do
    resources :comments
  end
  
  devise_for :users
  root 'home#index'
  get '/askexpert' => 'posts#askexpert'
  get'/learn' => 'home#learn'
  get'/videos' => 'home#videos'
  get'/blogs' => 'home#blogs'
  get'calcs' => 'home#calcs'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  
end
