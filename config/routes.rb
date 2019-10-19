Rails.application.routes.draw do
  root to: "group_sets#index"
  resources :group_sets, only: [:index, :show, :new, :create, :destroy] do
    scope module: :group_sets do
      resources :groups, only: [:new, :create, :destroy]
      resource :applied_status, only: [:update]
    end
  end
end
