Rails.application.routes.draw do
  root "tasks#index"
  resources :users do
    resources :tasks do
      member do
        get :complete
      end
    end
  end
end
