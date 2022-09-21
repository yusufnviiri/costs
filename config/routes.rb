Rails.application.routes.draw do
  devise_for :users
  resources :entities
  resources :groups
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_scope :user do
    # Redirests signing out users back to sign-in
    get "users", to: "devise/sessions#new"
  end
  # Defines the root path route ("/")
  root "entities#index"
end
