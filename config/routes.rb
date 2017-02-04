Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :session
  resources :spots
  resources :reservations
  resources :users
  get 'welcome/index'

  root 'welcome#index'


end
