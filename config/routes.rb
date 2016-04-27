Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'
  root "welcome#index"

  resources :users do
    resources :task_lists, only: [:create, :index]
  end

  resources :task_lists, except: [:create, :index] do
    resources :tasks, only: [:create]
  end

end
