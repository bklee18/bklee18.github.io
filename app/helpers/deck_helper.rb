def current_deck
  Deck.find(session[:deck_id])
end

def current_round
  if session[:round_id]
    Round.find(session[:round_id])
  end
end

# def current_user
#   User.find(1)
# end

def shuffle
  current_round.cards.shuffle.first.id
  # current_round.cards.
end
