Rails.application.routes.draw do
  get 'appointment/show'
  root "users#index"

  resources :students
  resources :mentors
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root to: "users#index"
end
