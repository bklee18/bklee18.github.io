def round?(id)
  Round.exists?(id)
end

def round_user?(id)
  if round?(id)
    if login?
      Round.find(id).user.id == current_user.id
    end
  end
end

def current_round
  Round.find(session[:round_id]) if session[:round_id]
end

def shuffled_card
  current_round.cards.shuffle.first
end

def round_win?
  current_round.guesses.where(correct: true).length == current_round.cards.length
end

def round_card_correctly_answered?(round_card)
  Guess.where(round_id: current_round.id, card_id: round_card.id, correct: true).length > 0
end
