Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html	
  devise_for :users, controllers: { sessions: 'users/sessions' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :spots
  resources :reservations
  resources :users
  get 'welcome/index'

  root 'welcome#index'

  get 'users/:id' => 'users#show'


end
