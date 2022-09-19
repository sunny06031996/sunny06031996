Rails.application.routes.draw do
   namespace :api do
    namespace :v1 do
      resources :employees
       post "/login", to: "employees#login"
      resources :posts
      resources :events
    end  
  end    
  
end
