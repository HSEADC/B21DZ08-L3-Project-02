Rails.application.routes.draw do
  devise_for :users

  # resources :plants do
  #   resources :comments, except: :show
  # end

  resources :subscriptions, only: [:create, :show]

  get 'welcome/index'
  get 'welcome/about'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "welcome#index"


  namespace :admin do
    resources :plants do
      resources :comments, except: :show
    end
    resources :comments
    resources :subscriptions

    root "admin/plants#index"
  end
end
