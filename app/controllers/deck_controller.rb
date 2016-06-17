get '/session-viewer' do
  session.inspect
end

get '/decks' do
  @decks = Deck.all

  erb :'decks/index'
end

get '/decks/:id' do
  session[:deck_id] = params[:id]

  erb :'decks/show'
end


get '/decks/:id/cards/' do
  # current_deck.cards.each do |card|
    # Game.create!(question: card.question, correct_answer: card.correct_answer, session_id: session[:session_id])
  # end
  user_id = session[:user_id] || 0
  round = Round.create!(user_id: user_id, deck_id: current_deck.id)
  session[:round_id] = round.id

  # redirect "/decks/#{current_deck.id}/cards/#{round.cards.shuffle.first.id}"
  redirect "/rounds/#{current_round.id}"
end



