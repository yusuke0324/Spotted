Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :spots
  resources :reservations
  get 'welcome/index'

  root 'welcome#index'

  get 'users/:id' => 'users#show'


end
