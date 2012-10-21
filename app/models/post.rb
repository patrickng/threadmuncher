class Post < ActiveRecord::Base
  attr_accessible :title, :url, :body, :type_of_post, :upvote, :downvote

  validates :type_of_post, presence: "true"

  has_many :comments
  has_many :votes
  belongs_to :user
  belongs_to :category

  def total_votes
    votes.where(vote: true).size - votes.where(vote: false).size
  end

  def upvotes
    votes.where(vote: true).size
  end

  def downvotes
    votes.where(vote: false).size
  end
end
