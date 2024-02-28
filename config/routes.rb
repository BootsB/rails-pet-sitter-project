Rails.application.routes.draw do
  devise_for :users

  resources :profiles, only: [:new, :edit, :create, :update]
  get '/profiles/:id', to: 'profiles#show', as: 'user_profile'
  delete '/profiles/:id', to: 'profiles#destroy', as: 'delete_user_profile'
  delete '/profiles/:id/remove_image', to: 'profiles#remove_image', as: 'remove_profile_image'

  get '/dashboard', to: 'profiles#dashboard', as: 'request_dashboard'
  get '/profiles/:id/dashboard', to: 'profiles#dashboard', as: 'dashboard'

  resources :pets do
    resources :requests, only: [:create] do
      post :accept, on: :member
      post :decline, on: :member
    end
    collection do
      get :pet_listings
    end
  end

  root to: "pages#home"
end
