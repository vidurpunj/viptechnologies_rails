Rails.application.routes.draw do
  devise_for :users, ActiveAdmin::Devise.config
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  root to: 'rails/health#show'
  # Defines the root path route ("/")
  # root "posts#index"
  post '/signup', to: 'api/signup#register'
  post '/signin', to: 'api/signup#login'
  post '/news_letter/subscribe', to: 'api/news_letter#subscribe'
  post '/contact_us/create', to: 'api/contact#create'
end


