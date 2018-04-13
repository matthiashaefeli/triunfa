Rails.application.routes.draw do

  mount ActionCable.server => '/cable'

  devise_for :users
  resources :welcome, only: [:index, :destroy]
  resources :statistics, only: [:index, :create, :destroy]
  resources :courses
  resources :groups
  resources :teachers
  resources :students
  resources :rooms
  resources :messages
  resources :chats
  resources :conversations
  resources :tables
  root "welcome#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
