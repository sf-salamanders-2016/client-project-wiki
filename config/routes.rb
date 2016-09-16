Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'appointment/show'
  get "login" => "sessions#new", :as => "login"

  post 'login' => 'sessions#new', :as => :login_path
  post 'logout_path' => 'sessions#destroy', :as => :logout_path

  root to: "users#new"
  resource :users, except: [:index]
end
