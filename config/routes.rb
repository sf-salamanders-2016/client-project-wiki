Rails.application.routes.draw do
  get 'ratings/new'

  get 'ratings/show'

  get 'ratings/create'

  get 'appointments/show'

  root "users#index"

  resources :appointments
  resources :students
  resources :mentors

end
