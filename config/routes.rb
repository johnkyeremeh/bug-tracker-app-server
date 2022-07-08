Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      # resources :users, only: [:create]
      post '/login', to: 'sessions#login'
      post '/signup', to: 'users#signup'
      get "/bugs", to: 'bugs#index'
    end
  end
end
 