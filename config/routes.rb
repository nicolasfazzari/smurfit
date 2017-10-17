Rails.application.routes.draw do
  resources :indicators
  root "indicators#index"

end
