Rails.application.routes.draw do
  get 'pages/contact'
  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  root "home#index"

  resources :terms, only: [:index] do
    collection { get :search }
  end

  resource :level, only: [:new, :edit, :update]

  get "up" => "rails/health#show", as: :rails_health_check
  get "/how_to_use", to: "pages#how_to_use"
  get "/contact", to: "pages#contact"

end