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
  resources :plants do
    resources :comments, except: :show
    resources :notes, except: :show
    get "/by_tag/:tag", to: "plants#by_tag", on: :collection, as: "tagged"
  end
  resources :ideas do
    member do
      match 'toggle_savedIdeas', to: 'ideas#toggle_savedIdeas', as: 'toggle_savedIdeas', via: [:get, :post]
    end
  end

  root "welcome#main"


  get 'welcome/main'
  get 'welcome/index'
  get 'welcome/about'
  get 'welcome/feed'
  get 'welcome/exchange'
  get 'welcome/wishlist'
  get 'welcome/myswaps'
  get 'welcome/savedIdeas'

  post 'support/request_support'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  
  

  namespace :admin do
    resources :plants do

      resources :comments, except: :show
      resources :notes, except: :show

      get "/by_tag/:tag", to: "plants#by_tag", on: :collection, as: "tagged"
    end

    resources :ideas do
      member do
        match 'toggle_savedIdeas', to: 'ideas#toggle_savedIdeas', as: 'toggle_savedIdeas', via: [:get, :post]
      end
    end 
    
    resources :comments
    resources :subscriptions
    resources :notes
    resources :swaps

    root "admin/plants#index"
  end
end
