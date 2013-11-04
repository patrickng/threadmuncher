class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :url, :body, :type_of_post, :category, :num_comments, :upvotes, :downvotes, :author, :created_at
  # attribute :num_comments, key: :number_of_comments
  # has_one :user, key: :author

  def num_comments
    object.comments.size
  end

  def author
    object.user.handle
  end

  def category
    object.category.name
  end
end
