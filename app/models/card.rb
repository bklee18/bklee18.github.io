class Card < ActiveRecord::Base
  belongs_to :deck
  has_many :guesses
  has_many :rounds, through: :deck

end
