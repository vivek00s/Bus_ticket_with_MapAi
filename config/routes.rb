Rails.application.routes.draw do
  resources :support_teams
  get 'map/index'
  get 'admin_dashboard/index'
  root 'landing#Dashboard'
  resources :buses
  get 'practice/index'
  resources :line_items
  resources :carts
  get 'gallery/index'
  post 'gallery/checkout'
    get 'gallery/checkout'
  get 'gallery/search'

  get 'gallery/purchase_complete'
  resources :phones
  resources :stores

  get 'admin/login'
  post 'admin/login', to: "admin#login"
  get 'home/index'
  get 'admin/logout'
  # post '/home/admin/logout',to: "admin#logout"
  devise_for :users

   
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  get "gallery/index"


  get 'buses/map', to: 'buses#map', as: 'bus_map'




  resources :line_items, only: [:create, :destroy] do
    member do
      patch :increase_quantity
      patch :decrease_quantity
    end
  end

end 