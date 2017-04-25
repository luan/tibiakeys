Rails.application.routes.draw do
  get 'static_pages/about'

  resources :key_assignments, only: [:destroy]
  resources :key_sets

  root 'key_sets#index'
end
