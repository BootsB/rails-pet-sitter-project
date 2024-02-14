Rails.application.routes.draw do
  devise_for :users do
    resources :requests
  end

  resources :pets do
    resources :requests
  end

  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
