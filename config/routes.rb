Rails.application.routes.draw do

  mount ActionCable.server => '/cable'

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
  resources :flyers
  get 'edituser/:id', to: 'welcome#edituser', as: 'edituser'
  post 'updateuser/:id', to: 'welcome#updateuser', as: 'updateuser'
  get 'updatepassword/:id', to: 'welcome#updatepassword', as: 'updatepassword'
  get 'tasks/download/:id', to: 'tasks#download', as: 'download'
  get 'papers/download/:id', to: 'papers#download', as:'paperdownload'
  get 'courses/download/:id', to: 'courses#download', as:'coursedownload'
  root "welcome#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
