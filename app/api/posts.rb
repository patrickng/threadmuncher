module Posts
  class Entity < Grape::Entity
    expose :id, :url, :title, :body, :created_at
    expose :comments, using: Comments::Entity
  end

  class Data < Grape::API
    helpers do
      def current_user
        if session[:user_id]
          @current_user ||= User.find(session[:user_id])
          @current_user_handle = @current_user.handle
        end
      end
    end
    resource :posts do
      desc "Posts"

      get do
        posts = Post.all
        present posts, with: Posts::Entity
      end

      params do
        requires :id, type: Integer, desc: "Post ID."
      end
      
      route_param :id do
        get do
          post = Post.find(params[:id])
          present post, with: Posts::Entity
        end
      end

      # params do
      #   requires current_user
      # end
      # post do

      # end
    end
  end
end