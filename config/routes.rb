Threadmuncher::Application.routes.draw do
  devise_for :users
  root to: "main#index"

  mount API => '/'

  # resources :users, only: [:new, :create]
  get "/user/:handle", to: "users#show", as: "user_profile"
  # get "/user/:handle/edit", to: "users#edit", as: "edit_user_profile"
  # put "/user/:handle", to: "users#update", as: "update_user_profile"
  
  # devise_for :users, controllers: { registrations: "users/registration" }

  # resources :sessions

  resources :categories, only: [:index, :show, :new, :create]

  resources :posts, path_names: { new: "submit" }, only: [:show, :new, :create] do
    resources :comments, only: [:create]
    resources :votes, only: [:create]
  end

  namespace :api, path: "", constraints: { subdomain: "api" }, defaults: { format: "json" } do
    namespace :v1 do
      resources :posts
    end
  end

  # devise_for :users 
  # devise_scope :user do
  #   get "logout" => "devise/sessions#destroy", as: "logout"
  #   get "login" => "devise/sessions#new", as: "login"
  #   get "signup" => "devise/registrations#new", as: "signup"
  # end
end