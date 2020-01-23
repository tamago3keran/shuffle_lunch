Rails.application.routes.draw do
  root to: "group_sets#index"
  resources :restaurants do
    resources :restaurant_notes, only: [:create, :destroy]
  end
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  namespace :admin do
    resources :users, only: [:index, :new, :create] do
      scope module: :users do
        resource :activation, only: [:update, :destroy]
      end
    end
    resources :group_sets, only: [:index, :show, :new, :create, :destroy] do
      scope module: :group_sets do
        resources :groups, only: [:new, :create, :edit, :update, :destroy]
        resource :applied_status, only: [:update]
      end
    end
  end
  resources :group_sets, only: [:index, :show] do
    scope module: :group_sets do
      resources :groups, only: [:show, :edit, :update]
    end
  end
  resources :users, only: [:index] do
    scope module: :users do
      resources :matching_scores, only: [:index]
    end
  end
  resources :restaurants
end
