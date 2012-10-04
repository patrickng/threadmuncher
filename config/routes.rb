CourseProject::Application.routes.draw do
  get "comments/index"

  root to: "posts#index"
  resources :posts
end
