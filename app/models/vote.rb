class Vote < ActiveRecord::Base
  attr_accessible :rank

  belongs_to :post
end
