CourseProject::Application.routes.draw do
  root to: "posts#index"

  resources :users, only: [:new, :create]
  resources :sessions
  resources :posts, only: [:index, :show, :new, :create] do
    resources :comments, only: [:create] do
      member do
        match "upvote"
        match "downvote"
      end
    end
    member do
      match "upvote"
      match "downvote"
    end
  end

  get "logout" => "sessions#destroy", as: "logout"
  get "login" => "sessions#new", as: "login"
  get "signup" => "users#new", as: "signup"
end