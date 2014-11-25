module Comments
  class Entity < Grape::Entity
    expose :id, :content, :created_at
  end

  class Data < Grape::API
    resource :comments do
      desc "Comments"

      get do
        comment = Comment.all
        present comment, with: Comment::Entity
      end
    end
  end
end