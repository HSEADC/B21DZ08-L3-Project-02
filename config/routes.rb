Rails.application.routes.draw do
  devise_for :users

  resources :plants do
    resources :comments, except: :show
  end



  get 'welcome/index'
  get 'welcome/about'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "welcome#index"
end
