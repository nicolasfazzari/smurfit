Rails.application.routes.draw do
  resources :kpis
  resources :kpis
  devise_for :users
  resources :indicators
  root "indicators#index"

end
