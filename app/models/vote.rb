class Vote < ActiveRecord::Base
  attr_accessible :vote, :post_id

  belongs_to :post
  belongs_to :user
end
