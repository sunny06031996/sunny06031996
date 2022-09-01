Rails.application.routes.draw do
  #get 'welcome/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
   root 'welcome#index'
  # Defines the root path route ("/")
   resources :students
   #get 'student/index'
  #get 'student/list'   
  # root "articles#index"
end
