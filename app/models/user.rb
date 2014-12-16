class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :handle, :twitter_handle, :password, :password_confirmation

  # validates :email, presence: "true"
  # validates :handle, presence: "true"
  # validates :password, on: :create, presence: "true"
  
  # has_secure_password
  # 
  before_save :ensure_authentication_token
  
  def ensure_authentication_token
    self.authentication_token ||= generate_authentication_token
  end

  has_many :posts
  has_many :votes
  has_many :comments

  private
  def generate_authentication_token
    loop do
      token = Devise.friendly_token
      break token unless User.where(authentication_token: token).first
    end
  end
end
