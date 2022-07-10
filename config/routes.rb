Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do

      #delete index
      resources :users, only: [:index, :create]

      #delete me 
      resources :projects, only: [:index, :create]

      get '/login', to: 'sessions#create'
      get "/auto_login", to: "sessions#auto_login" 
      
      #user can access this rute only if authed
      get "user_is_authed", to: "sessions#user_is_authed"

      post '/login', to: 'sessions#create'
      post '/signup', to: 'users#signup'
      post "/bugs", to: 'bugs#index'
     
      #delete me
      get "/bugs", to: 'bugs#index' 
    end
  end
end
 