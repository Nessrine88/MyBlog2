Rails.application.routes.draw do
  # get '/users', to: 'users#index'
  # get '/users/:id', to: 'users#show'
  # get '/users/:author_id/posts', to: 'posts#index'
  # get '/users/:author_id/posts/:id', to: 'posts#show'

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show]
  end

  # Rest of your routes...

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
