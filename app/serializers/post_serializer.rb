class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :url, :body, :type_of_post
  has_many :comments
  has_one :user, key: :author
end
