def current_deck
  Deck.find(session[:deck_id])
end

def current_round
  if session[:round_id]
    Round.find(session[:round_id])
  else
    nil
  end
end

def shuffled_card
  current_round.cards.shuffle.first
end
