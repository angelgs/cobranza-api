Rails.application.routes.draw do
  resources :clientes do
    resources :contratos, :defaults => { :format => 'json' }
  end
  resources :cobradores do
    resources :contratos, only: [:index, :show], :defaults => { :format => 'json' }
    resources :pagos, only: [:index, :show, :create, :update], :defaults => { :format => 'json' }
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
