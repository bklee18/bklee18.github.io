def current_deck
  Deck.find(session[:deck_id])
end

