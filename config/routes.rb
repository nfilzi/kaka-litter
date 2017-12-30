Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations'}
  root to: 'pages#home'
  get 'pages/legal' => "pages#legal"
  get 'pages/shop' => "pages#shop"
  get 'pages/success' => "pages#success"

  resources :products, except: [:new, :destroy]
  resources :companies, only: [:new, :create]
  resources :orders, only: [:new, :create]
  resources :shipping_addresses, only: [:create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
