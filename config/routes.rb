Rails.application.routes.draw do

  devise_for :users
  resources :welcome, only: [:index]
  resources :courses
  resources :groups
  resources :teachers
  resources :students
  resources :rooms
  resources :messages
  root "welcome#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
