Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :offers do
    resources :bookings
  end
  get '/my_bookings', to: 'pages#my_bookings' # mes reservations
  get '/my_requests', to: 'pages#my_requests' # mes annonces
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
end
