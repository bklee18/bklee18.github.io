class User < ActiveRecord::Base
  has_many :rounds
  has_many :guesses

  validates :username, :password, :email, presence: true
  validates :username, uniqueness: true
  has_secure_password

end
