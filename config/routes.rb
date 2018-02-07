Rails.application.routes.draw do
  post 'reports/estadistica'
  get 'reports/estadistica1'
  get 'reports/reporte'
  get 'reports/validacion'

  get 'reports/verificacion'

  get 'reports/bitacora'

  get 'reports/caractula1'

  get 'reports/caractula2'

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
