Rails.application.routes.draw do
   namespace :api do
    namespace :v1 do
      resources :employees
       post "/login", to: "employees#login"
       get 'employees/show_employee/:teamlead_id', to: 'employees#show_employee'
      resources :posts
      resources :events
      resources :comments
    end  
  end    
  
end
