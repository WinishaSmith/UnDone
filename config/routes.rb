Rails.application.routes.draw do
  root "tasks#index"
  resources :users
  resources :tasks do
    member do
      get :complete
    end
  end
end
