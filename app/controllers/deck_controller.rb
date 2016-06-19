get '/session-viewer' do
  session.inspect
end

get '/decks' do
  @decks = Deck.all

  erb :'decks/index'
end

get '/decks/new' do

  erb :'decks/new'
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

post '/decks' do
  deck = Deck.create!(name: params[:name])
  session[:deck_id] = deck.id

  redirect "/decks/#{deck.id}/cards/new"
end

get "/decks/:id/cards/new" do
  @deck = current_deck

  erb :'/decks/cards/new'
end

post "/decks/:id/cards" do
  card = Card.new(deck: current_deck, question: params[:question], correct_answer: params[:answer])
  if card.save
    redirect "/decks/#{current_deck.id}/cards/add"
  else
    @errors = card.errors.full_messages
    erb :'/decks/cards/new'
  end
end

get "/decks/:id/cards/add" do
  erb :'decks/cards/add'
end

get "/decks/:id/cards/done" do
  erb :'decks/cards/done'
end
