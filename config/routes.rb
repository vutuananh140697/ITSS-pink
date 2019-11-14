Rails.application.routes.draw do
  root "home#index"
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers:{omniauth_callbacks: "users/omniauth_callbacks"}
  resources :users, only: %i(index show destroy) do
    resources :schedules, only: %i(index create destroy)
  end
  get "/search", to: "home#search"
  get "services/:id" , to: "services#show"
end
