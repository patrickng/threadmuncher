CourseProject::Application.routes.draw do
  root to: "posts#index"

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
end