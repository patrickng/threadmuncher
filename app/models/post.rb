class Post < ActiveRecord::Base

  ActionView::Base.field_error_proc = proc { |input, instance| input } 

  attr_accessible :title, :url, :body, :type_of_post, :upvote, :downvote

  validates :type_of_post, presence: "true", numericality: "true"
  validates :type_of_post, inclusion: { in: 1..2, message: "Invalid post type" }
  validates :title, presence: "true"
  validates :category_id, presence: "true"

  validates :url, presence: "true", if: Proc.new { |o| o.type_of_post == 1 }
  validates :body, presence: "true", if: Proc.new { |o| o.type_of_post == 2 }

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
