Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  put 'self_organizing_maps/:id/datapoints', to: 'self_organizing_maps#datapoints'
  resources :self_organizing_maps, only: [:index, :show, :create]
end
