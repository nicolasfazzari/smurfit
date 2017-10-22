Rails.application.routes.draw do
  devise_for :users
  resources :indicators
  root "indicators#index"

end
