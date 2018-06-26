Rails.application.routes.draw do


  # devise_for :users
  root 'static_pages#home'
  get '/dashboard' => 'static_pages#dashboard'
  resources :courses do
    resources :assignments
    resources :grades
  end

  resources :assignments
  resources :grades
  resources :students
  resources :enrollments
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
