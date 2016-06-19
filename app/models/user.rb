class User < ActiveRecord::Base
  has_many :rounds
  has_many :guesses
  has_many :decks, through: :rounds
  has_many :created_decks, { class_name: "Deck", foreign_key: :author_id }

  validates :username, :password, :email, presence: true
  validates :username, uniqueness: true
  validate :guest_user_reserved_username
  has_secure_password

  def guest_user_reserved_username
    if username.downcase.match(/\Aguest_user\.*/)
      errors.add :reserved_username, "'guest_user*' is a reserved username, please enter a different username"
    end
  end
end
