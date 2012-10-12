class Post < ActiveRecord::Base
  attr_accessible :title, :url, :body, :type_of_post, :upvote, :downvote

  validates :type_of_post, presence: "true"

  has_many :comments
end
