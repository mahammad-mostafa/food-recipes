Rails.application.routes.draw do
  devise_for :users, path_names: { sign_in: 'login', sign_up: 'register', sign_out: 'logout' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "users#index"
  resources :foods, only: [:index, :new, :create, :destroy] do
    get "/page/:page", action: :index, on: :collection
    collection { get :shop }
  end
  resources :recipes, only: [:index, :show, :edit, :new, :create, :destroy] do
    get "/page/:page", action: [:index, :public], on: :collection
    collection { get :public }
    resources :recipe_foods, only: [:new, :create, :destroy]
  end
  get "*path", to: "application#index"
end
