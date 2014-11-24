module Posts
  class PostEntity < Grape::Entity

    expose :id, :url, :title, :body
  end
  class Data < Grape::API
    resource :posts do
      desc "Posts"

      get do
        posts = Post.all
        present posts, with: Posts::PostEntity
      end
    end
  end
end