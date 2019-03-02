Rails.application.routes.draw do
  resources :posts do

    collection do
      get "d_backnumber"
      get "d_profile"
      get "d_Circumstances"
    end
  end
  root "posts#index"

  get "login" => "authors#login_form"
  post "login" => "authors#login"
  post "logout" => "authors#loout"
  get "logout" => "authors#logout"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end