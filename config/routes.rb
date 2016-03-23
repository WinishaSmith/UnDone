Rails.application.routes.draw do
  resources :users do
    resources :tasks do
      member do
        get :complete
      end
    end
  end
  root "tasks#index"
  resource :session
end
