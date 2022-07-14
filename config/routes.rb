Rails.application.routes.draw do
  get '/dashboard', to: 'static#home'

  #signup
  post '/api/v1/signup', to: 'api/v1/sessions#create'

  #login
  post '/api/v1/login', to: 'api/v1/sessions#create'

  #Logout
  delete "/api/v1/logout", to: "api/v1/sessions#destroy" 

  #Set Current User
  get "/api/v1/get_current_user", to: "api/v1/sessions#get_current_user"

  
  namespace :api do
    namespace :v1 do
      resources :bugs
      resources :users, only: [:index, :create]
      resources :projects
      resources :bugs
    end
  end
end
 