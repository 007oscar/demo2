Rails.application.routes.draw do
  resources :validations
  resources :verifications
  resources :specialties
  resources :registries
  resources :titles
  resources :authorities
  resources :results
  resources :experts
  resources :cities
  resources :expedients
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
