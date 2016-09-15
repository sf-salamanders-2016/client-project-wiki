Rails.application.routes.draw do
  get 'appointment/show'
  root "users#index"

  resources :students
  resources :mentors
end
