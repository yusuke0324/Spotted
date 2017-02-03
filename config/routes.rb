Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :session
  
  resources :users
  resources :spots
  resources :reservations
  get 'welcome/index'

  root 'welcome#index'


end
