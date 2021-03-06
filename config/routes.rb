# frozen_string_literal: true

Rails.application.routes.draw do

  mount ActionCable.server => "/cable"

  devise_for :users, controllers: { registrations: "users/registrations" }
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
  resources :tasks
  resources :libraries, only: [:index]
  resources :talks
  resources :admins, only: [:create, :destroy]
  resources :folders, only: [:create, :destroy]
  resources :papers, only: [:create, :destroy]
  resources :assignments, only: [:create, :destroy, :show]
  resources :finished_assignments, only: [:index, :create, :destroy]
  resources :flyers, only: [:create, :destroy]
  resources :comments, only: [:create]
  resources :likes
  resources :resources, only: [:index, :create, :destroy]
  resources :links, only: [:create, :destroy]
  resources :sentences, only: [:create, :update]
  resources :publications, only: [:index, :create, :destroy]
  resources :todos
  resources :groseries
  resources :calendars, only: [:index]
  resources :events
  resources :weather, only: [:index]
  resources :translate, only: [:index]
  resources :grammar, only: [:index]
  resources :comunity, only: [:index]
  resources :map, only: [:index]
  resources :spaces
  resources :articles
  resources :model_mailer, only: [:index, :create]
  get "edituser/:id", to: "welcome#edituser", as: "edituser"
  post "updateuser/:id", to: "welcome#updateuser", as: "updateuser"
  get "updatepassword/:id", to: "welcome#updatepassword", as: "updatepassword"
  get "tasks/download/:id", to: "tasks#download", as: "download"
  get "papers/download/:id", to: "papers#download", as: "paperdownload"
  get "courses/download/:id", to: "courses#download", as: "coursedownload"
  root "welcome#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
