Rails.application.routes.draw do
  root to: "group_sets#index"
  namespace :admin do
    resources :users, only: [:index, :new, :create] do
      scope module: :users do
        resource :activation, only: [:update, :destroy]
      end
    end
  end
  resources :group_sets, only: [:index, :show] do
    namespace :admin do
      resources :group_sets, only: [:index, :show, :new, :create, :destroy] do
        scope module: :group_sets do
          resources :groups, only: [:new, :create, :edit, :update, :destroy]
          resource :applied_status, only: [:update]
        end
      end
    end
  end
end
