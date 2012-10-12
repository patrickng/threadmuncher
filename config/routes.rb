CourseProject::Application.routes.draw do
  root to: "posts#index"

  resources :posts, only: [:index, :show, :new, :create] do
    resources :comments, only: [:create]
    member do
      match "upvote"
      match "downvote"
    end
  end
end