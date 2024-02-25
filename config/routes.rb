Rails.application.routes.draw do

  

  devise_for :users

  namespace :api do
    namespace :v1 do
      resources :plants, defaults: { format: :json }

      devise_scope :user do
        post "sign_up", to: "registrations#create"
        post "sign_in", to: "sessions#create"
        post "sign_out", to: "sessions#destroy"
      end
    end
  end

  resources :profiles, only: [:show, :edit, :update]
  # resources :plants do
  #   resources :comments, except: :show
  # end

  resources :subscriptions, only: [:create, :show]
  resources :swaps
  get 'welcome/main'
  get 'welcome/index'
  get 'welcome/about'
  get 'welcome/feed'
  get 'welcome/exchange'
  get 'welcome/profile'
  get 'welcome/wishlist'
  get 'welcome/myswaps'

  post 'support/request_support'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "welcome#main"


  namespace :admin do
    resources :plants do
      resources :comments, except: :show
      resources :notes, except: :show

      get "/by_tag/:tag", to: "plants#by_tag", on: :collection, as: "tagged"
    end
    
    resources :comments
    resources :subscriptions
    resources :ideas
    resources :notes
    resources :swaps

    root "admin/plants#index"
  end
end
