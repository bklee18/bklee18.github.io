class Card < ActiveRecord::Base
  belongs_to :deck
  has_many :guesses
  has_many :rounds, through: :deck

  validates :question, presence: true
  validates :correct_answer, presence: true
end
