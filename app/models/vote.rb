class Vote < ActiveRecord::Base
  attr_accessible :vote, :post_id, :user_id

  belongs_to :post
  belongs_to :user
end
