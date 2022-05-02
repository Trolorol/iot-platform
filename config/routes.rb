Rails.application.routes.draw do
  post "/devices/:id/toggle_device", to: "devices#toggle_device"

  resources :schedulings
  root to: "home#index"
  resources :devices
  resources :trigger_types
  resources :triggers
  resources :groups

  

end

