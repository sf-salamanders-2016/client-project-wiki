Rails.application.routes.draw do
  # get 'mentor_reviews/new'

  # get 'mentor_reviews/show'

  # get 'student_reviews/new'

  # get 'student_reviews/show'

  get 'appointments/show'

  root "users#index"

  resources :appointments do
    resources :student_reviews
    resources :mentor_reviews
  end

  resources :students
  resources :mentors

end
