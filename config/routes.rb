Rails.application.routes.draw do
  get 'pages/contact'

  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  devise_scope :user do
    get "users/auth/failure", to: "users/omniauth_callbacks#failure"
  end

  root "home#index"

  resources :terms, only: [:index] do
    collection do
      get :search
      get :suggestions
    end
  end

  resource :level, only: [:new, :edit, :update]

  get "up" => "rails/health#show", as: :rails_health_check
  get "/how_to_use", to: "pages#how_to_use"
  get "/contact", to: "pages#contact"
  get "/terms_of_service", to: "pages#terms"
  get "/privacy_policy", to: "pages#privacy_policy"

end