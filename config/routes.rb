Rails.application.routes.draw do
  devise_for :users do
    resources :requests
  end
  resources :profiles, only: [:new, :edit, :create, :update]
  get "users/:id", to: "profile#show", as: "user_profile" #just for show

  resources :pets do
    resources :requests
  end

  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
