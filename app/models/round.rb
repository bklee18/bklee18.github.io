class Round < ActiveRecord::Base
  belongs_to :user
  belongs_to :deck
  has_many :cards, through: :deck
  has_many :guesses

  def unanswered_cards
    self.unanswered_card
  end
end
