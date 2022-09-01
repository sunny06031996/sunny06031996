Rails.application.routes.draw do

  
  devise_for :employees
  get 'posts/create'
  #get 'home/index'
  root to: 'home#index'
  resources :events 
   
end
