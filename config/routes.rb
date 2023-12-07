Rails.application.routes.draw do
  devise_for :users

  namespace :api do
    namespace :v1 do
      resources :plants, defaults: { format: :json }
    end
  end

  # resources :plants do
  #   resources :comments, except: :show
  # end

  resources :subscriptions, only: [:create, :show]

  get 'welcome/index'
  get 'welcome/about'
  get 'welcome/feed'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "welcome#index"


  namespace :admin do
    resources :plants do
      resources :comments, except: :show
      resources :notes, except: :show
    end
    
    resources :comments
    resources :subscriptions
    resources :ideas
    resources :notes
    resources :swaps

    root "admin/plants#index"
  end
end
