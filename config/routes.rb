Rails.application.routes.draw do
  resources :group_sets, only: [:index, :show, :new, :create] do
    scope module: :group_sets do
      resource :applied_status, only: [:update]
    end
  end
end
