Rails.application.routes.draw do
  devise_for :users
  root "home#index"

  resources :terms, only: [:index] do
    collection do
      get :search
    end
  end

  resource :level, only: [:new, :edit, :update]

  get '/auth/:provider/callback', to: 'sessions#omniauth'
  get '/auth/failure', to: redirect('/')

  get "up" => "rails/health#show", as: :rails_health_check
end