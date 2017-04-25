Rails.application.routes.draw do
  get 'static_pages/about'

  resources :key_sets
  resources :key_assignments

  root 'key_sets#index'
end
