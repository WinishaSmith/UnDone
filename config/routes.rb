Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'
  root "welcome#index"

  resources :users do
    resources :task_lists do
      resources :tasks
    end
  end

end
