Rails.application.routes.draw do

devise_for :users, controllers: { registrations: 'registrations' }
  root 'users#index'
resources :users, only: [:index, :show] do
  resources :posts, only: [:index, :show, :create, :new] do 
    post 'likes', to: 'likes#create'
    resources :comments, only: [:create, :new]
  end
end

  get "up" => "rails/health#show", as: :rails_health_check

end
