Rails.application.routes.draw do
  resources :schedulings
  
  root to: "home#index"
  resources :devices
  resources :trigger_types
  resources :triggers
  resources :groups

end

