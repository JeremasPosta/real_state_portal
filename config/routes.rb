Rails.application.routes.draw do
  root to: 'properties#index'
  get 'status/index'
  get 'properties', to: 'properties#index'
  get 'properties/:id', to: 'properties#show', as: 'property'
  post 'properties/contact', to: 'properties#contact'
end
