class Comment < ActiveRecord::Base
  attr_accessible :content

  validates :content, presence: "true"

  belongs_to :post
  belongs_to :user
end
