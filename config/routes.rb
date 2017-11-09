Rails.application.routes.draw do
  resources :documentations
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :kpis
  devise_for :users
  resources :indicators
  root "indicators#index"

end
