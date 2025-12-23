Rails.application.routes.draw do
  root "home#index"

  resources :terms, only: [:index] do
    collection do
      get :search
    end
  end

  resource :level, only: [:new, :edit, :update]

  get "up" => "rails/health#show", as: :rails_health_check
end