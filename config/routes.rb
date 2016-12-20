Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations'}
  root to: 'pages#home'
  get "/static_components" => "pages#static_components"
  get "/test_api_google_drive" => "pages#test_api_google_drive"

  resources :companies, only: [:new, :create]
  resources :orders, only: [:new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
