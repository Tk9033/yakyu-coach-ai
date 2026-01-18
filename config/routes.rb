Rails.application.routes.draw do
  devise_for :users

  root "home#index"

  resources :terms, only: [:index] do
    collection { get :search }
  end

  resource :level, only: [:new, :edit, :update]

  # OmniAuth callback だけを書く
  get '/auth/:provider/callback', to: 'sessions#omniauth'
  get '/auth/failure', to: redirect('/')

  get "up" => "rails/health#show", as: :rails_health_check
end