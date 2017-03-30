Rails.application.routes.draw do

  root 'listings#index'

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"


  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  # resources generate id, resource generate no id

  resources :users, controller: "users", only: [:create, :show, :edit, :update, :destroy] do
    resource :password, controller: "clearance/passwords", only: [:create, :edit, :update]
  end

  #set up a route in our app that matches to the callback URL, i.e. a URL that redirects the user from Facebook to your app
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"

  resources :listings


  get '/users/:id/listings' => 'listings#index', as: "user_listings"

  resources :reservations,  only: [:new, :create, :show] #same with/without controller: "reservations"

  get '/users/:id/reservations' => 'reservations#index', as: "user_reservations"



end
