Rails.application.routes.draw do
  get 'status/index'
  get 'properties', to: 'properties#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
