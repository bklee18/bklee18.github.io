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
  user_id = session[:user_id] || 0
  round = Round.create!(user_id: user_id, deck_id: current_deck.id)
  session[:round_id] = round.id

  redirect "/rounds/#{current_round.id}"
end



