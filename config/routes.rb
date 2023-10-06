Rails.application.routes.draw do
  resources :articles
  get 'diary/index'
  get 'profile/index'
  resources :comments
  resources :posts
  get 'welcome/index'
  get 'welcome/about'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "welcome#index"
end
