class Post < ActiveRecord::Base
  attr_accessible :title, :url, :body, :type_of_post

  has_many :comments
end
