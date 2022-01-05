Rails.application.routes.draw do
  get 'status/index'
  get 'properties', to: 'properties#index'
  get 'properties/:id', to: 'properties#show', as: 'property'
end
