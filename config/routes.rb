Rails.application.routes.draw do
  resources :posts do


    collection do
      get "d_backnumber"
      get "d_profile"
      get "d_Circumstances"
    # get "posts/backnumber" => "posts#backnumber"
  # resources :page
    end
  end
  root "posts#index"

  # get 'posts/index'
  # get 'posts/show'
  # get 'posts/new'
  # get 'posts/create'
  # get 'posts/edit'
  # get 'posts/update'
  # get 'posts/destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end