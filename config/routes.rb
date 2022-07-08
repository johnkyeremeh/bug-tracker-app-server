Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :create]

      #delete me 
      resources :projects, only: [:index, :create]

      post '/login', to: 'sessions#login'
      post '/signup', to: 'users#signup'
      post "/bugs", to: 'bugs#index'
     
      #delete me
      get "/bugs", to: 'bugs#index' 
    end
  end
end
 