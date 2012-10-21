CourseProject::Application.routes.draw do
  root to: "main#index"

  resources :users, only: [:new, :create]
  get "/user/:handle", to: "users#show", as: "user_profile"

  resources :sessions

  resources :categories, only: [:index, :show, :new, :create]

  resources :posts, path_names: { new: "submit" }, only: [:index, :show, :new, :create] do
    resources :comments, only: [:create]
    resources :votes, only: [:create]
  end

  get "logout" => "sessions#destroy", as: "logout"
  get "login" => "sessions#new", as: "login"
  get "signup" => "users#new", as: "signup"
end