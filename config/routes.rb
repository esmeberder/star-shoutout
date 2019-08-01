Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:show, :index]
  get 'user_dashboard', to: 'users#user_dashboard'
  get 'star_dashboard', to: 'users#star_dashboard'
  resources :services do
    resources :bookings, shallow: true
  end

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
