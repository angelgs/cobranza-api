Rails.application.routes.draw do
  resources :pagos
  resources :clientes do
    resources :contratos
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
