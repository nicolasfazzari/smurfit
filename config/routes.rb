Rails.application.routes.draw do
  get 'todo_lists/:todo_list_id/tags/:tag', to: 'todo_lists#show', as: :tag
  resources :todo_lists do
  	resources :todo_items
  end
  resources :documentations
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :kpis
  devise_for :users
  resources :indicators
  root "indicators#index"

end
