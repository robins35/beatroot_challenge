Rails.application.routes.draw do
  get 'tracks/index'
  get 'tracks/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'tracks#index'

  resources :tracks, only: [:index, :show]
end
