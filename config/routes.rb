Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # get 'mentor_reviews/new'

  # get 'mentor_reviews/show'

  # get 'student_reviews/new'

  # get 'student_reviews/show'

  get 'appointments/show'

  root :to => "users#new"

  resources :appointments do
    resources :student_reviews
    resources :mentor_reviews
  end

  resources :students
  resources :mentors
  resources :users, except: [:index]

  get 'appointment/show'
  get 'login' => 'sessions#new', :as => 'login'

  post 'login' => 'sessions#create', :as => :login_path
  get 'logout' => 'sessions#destroy', :as => :logout_path

  get 'ratings/new'
  get 'ratings/show'
  get 'ratings/create'

  get 'appointments/show'

end
