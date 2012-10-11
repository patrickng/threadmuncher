CourseProject::Application.routes.draw do
  root to: "posts#index"

  resources :posts, only: [:index, :show, :new, :create] do
    resources :comments, only: [:create]
    resources :votes, only: [:create]
  end
end