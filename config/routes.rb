Rails.application.routes.draw do


  root 'home#index'

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"

  resources :users, only: [:show, :edit, :update, :delete]


# /Clearance Document
  # constraints Clearance::Constraints::SignedIn.new { |user| user.admin? } do
  #   root to: "admin/dashboards#show", as: :admin_root
  # end

  # constraints Clearance::Constraints::SignedIn.new do
  #   root to: "dashboards#show", as: :signed_in_root
  # end

  # constraints Clearance::Constraints::SignedOut.new do
  #   root to: "marketing#index"
  # end
# /end


  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  # resources generate id, resource generate no id

  resources :users, controller: "clearance/users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end




  #set up a route in our app that matches to the callback URL, i.e. a URL that redirects the user from Facebook to your app
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"
end
