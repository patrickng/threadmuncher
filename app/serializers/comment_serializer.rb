class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content
  attribute :content, key: :body

  has_one :user, key: :author
end
