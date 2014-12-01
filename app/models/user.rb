class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, stretches: 20

  # attr_accessible :email, :handle, :twitter_handle, :password, :password_confirmation

  # validates :email, presence: "true"
  # validates :handle, presence: "true"
  # validates :password, on: :create, presence: "true"
  
  # has_secure_password

  has_many :posts
  has_many :votes
  has_many :comments
end
