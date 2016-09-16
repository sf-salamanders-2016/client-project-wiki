Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'index'

  resources :appointments
  resources :students
  resources :mentors
  resource :users, except: [:index]

  get 'appointment/show'
  get 'login' => 'sessions#new', :as => 'login'

  post 'login' => 'sessions#new', :as => :login_path
  post 'logout_path' => 'sessions#destroy', :as => :logout_path

  get 'ratings/new'
  get 'ratings/show'
  get 'ratings/create'

  get 'appointments/show'

end
