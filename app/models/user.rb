class User < ActiveRecord::Base
  attr_accessible :email, :handle, :password, :password_confirmation

  validates :password, on: :create, presence: "true"

  has_secure_password
  has_many :posts
  has_many :post_votes
  has_many :comments
end
