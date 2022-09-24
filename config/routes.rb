Rails.application.routes.draw do
  devise_for :users
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_scope :user do
    # Redirests signing out users back to sign-in
    get "users", to: "devise/sessions#new"
  end
  # Defines the root path route ("/")
  unauthenticated :user do
    root to: 'splashs#index'
  end

  authenticated :user do
    root "groups#index", as: :authenticated_root
  end
  resources :user do
    resources :groups, only: %i[index new show create destroy] do
      resources :entities, only: %i[index new show create destroy]
    end
  end
end
