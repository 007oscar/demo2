Rails.application.routes.draw do
  root to: 'registries#index'
  post 'reports/estadistica'
  get 'reports/estadistica1'
  get 'reports/reporte'
  get 'reports/:id/validacion', to: 'reports#validacion', as: 'reports_validacion'
  get 'reports/:id/verificacion', to: 'reports#verificacion', as: 'reports_verificacion'
  get 'reports/:id/caractula1', to: 'reports#caractula1', as: 'reports_caractula1'
  get 'reports/:id/caractula2', to: 'reports#caractula2', as: 'reports_caractula2'

  get 'expedients/mostrar_expedientes', to: 'expedients#mostrar_expedientes', as: 'mostrar_expedientes'

  get 'reports/verificacion'
  # get 'reports/validacion/:id'
  get 'reports/bitacora'
  post 'reports/bitacora1'
  # get 'reports/caractula1'

  # get 'reports/caractula2'

  # resources :reports
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
