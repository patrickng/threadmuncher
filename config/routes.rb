CourseProject::Application.routes.draw do
  get "comments/index"

  root to: "main#index"
  resources :posts
end
