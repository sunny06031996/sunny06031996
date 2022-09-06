Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :employees
  get 'posts/create'
  resources :employees
  resources :posts
  resources :events
  get 'dashboard/hrdashboard'
   
end
