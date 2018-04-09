Rails.application.routes.draw do


  root 'static_pages#home'
  get '/dashboard' => 'static_pages#dashboard'
  resources :courses do
    resources :assignments
  end

  resources :assignments
  resources :grades
  resources :students

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
