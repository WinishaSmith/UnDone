Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'
  root "welcome#index"

   resources :users do
    resources :tasks do
      member do
        patch :complete
        # Nice!
      end
    end
   end

end
