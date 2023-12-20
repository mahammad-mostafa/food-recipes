Rails.application.routes.draw do
  devise_for :users, path_names: { sign_in: 'login', sign_up: 'register', sign_out: 'logout' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "users#index"
  resources :users, only: [:index] do
    resources :foods, only: [:index, :new, :create, :destroy]
    resources :recipes, only: [:index, :show, :new, :create, :destroy] do
      resources :recipes_foods, only: [:index, :new, :create, :destroy]
    end
  end
  get "*path", to: "application#index"
end
