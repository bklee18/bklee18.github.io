class User < ActiveRecord::Base
  has_many :rounds
  has_many :guesses
  has_many :decks, through: :rounds
  has_many :created_decks, { class_name: "Deck", foreign_key: :author_id }

  validates :username, :password, :email, presence: true
  validates :username, uniqueness: true
  has_secure_password


  # def guest_user
  #   @guest ||= Guest.new
  # end

end
