Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :kpis
  devise_for :users
  resources :indicators
  root "indicators#index"

end
