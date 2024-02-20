Rails.application.routes.draw do
  devise_for :users do
    resources :requests
  end
  resources :profiles, only: [:new, :edit, :create, :update]
  get '/profiles/:id', to: 'profiles#show', as: 'user_profile' #just for show profile
  delete '/profiles/:id', to: 'profiles#destroy', as: 'delete_user_profile' #just for delete profile
  delete '/profiles/:id/remove_image', to: 'profiles#remove_image', as: 'remove_profile_image' #just for remove image

  resources :pets do
    resources :requests
  end

  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
