Rails.application.routes.draw do
  get 'ratings/new'

  get 'ratings/show'

  get 'ratings/create'

  get 'appointments/show'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "users#index"

  resources :appointments


end
