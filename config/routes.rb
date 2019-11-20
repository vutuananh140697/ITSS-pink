Rails.application.routes.draw do
  get 'service_reviews/create'

  root "home#index"
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers:{omniauth_callbacks: "users/omniauth_callbacks"}
  resources :users, only: %i(index show destroy) do
    resources :schedules, only: %i(index create destroy)
  end
  get "/search", to: "home#search"
  get "services", to: "services#index"
  get "services/categories/:category_id", to: "services#index", :as => :service_categories
  get "services/:id" , to: "services#show", :as => :service_details
  resources :service_reviews, only: %i(create destroy)
end
