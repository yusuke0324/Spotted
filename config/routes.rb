Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  # devise_for :users, :controllers => { registrations: 'users/registrations' }
  # devise_for :users, :controllers => { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html




  resources :spots do
    resources :reservations
  end
  resources :users

  get 'welcome/index'

  root 'welcome#index'

  get 'users/:id' => 'users#show'

  get 'welcome/team'


end
