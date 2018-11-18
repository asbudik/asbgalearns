Rails.application.routes.draw do


  get "/", to: "sites#index", as: 'root'
  get "/about", to: "sites#show"

  resources :users
  resources :shoutouts

  resources :likes

  get "/bart_json(.:format)", to: "sites#json_bart"

  post "/shoutouts", to: 'shoutouts#create'
  post "/likes", to: 'likes#create'

  get "/show", to: "sites#show"
  get "/login", to: "sessions#new"
  post "/", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/logout", to: "sessions#destroy"
  get "/signup", to: "users#new"
  resources :passwords

end
