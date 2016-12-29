Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations'}
  root to: 'pages#home'
  get 'pages/legal' => "pages#legal"

  resources :companies, only: [:new, :create]
  resources :orders, only: [:new, :create]
  resources :shipping_addresses, only: [:create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
