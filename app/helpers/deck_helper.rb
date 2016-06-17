def current_deck
  Deck.find(session[:deck_id])
end

def current_round
  Round.find(session[:round_id])
end

