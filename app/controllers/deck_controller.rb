get '/session-viewer' do
  session.inspect
end

get '/decks' do
  @decks = Deck.all

  erb :'decks/index'
end

get '/decks/new' do
  redirect '/404' if !login?
  erb :'decks/new'
end

get '/decks/:id' do
  @author = Deck.find(params[:id]).author
  @user = current_user
  @deck = Deck.find(params[:id])
  erb :'decks/show'
end

get '/decks/:id/cards/' do
  session[:deck_id] = params[:id]
  user_id = session[:user_id] || 0
  round = Round.create!(user_id: user_id, deck_id: current_deck.id)
  session[:round_id] = round.id

  redirect "/rounds/#{current_round.id}"
end

post '/decks' do
  redirect '/404' if !login?

  deck = Deck.create!(name: params[:name], description: params[:description], author_id: session[:user_id])
  session[:deck_id] = deck.id

  redirect "/decks/#{deck.id}/cards/new"
end

get "/decks/:id/cards/new" do
  redirect '/404' if !login?
  @deck = current_deck

  erb :'/decks/cards/new'
end

post "/decks/:id/cards" do
  redirect '/404' if !login?
  card = Card.new(deck: current_deck, question: params[:question], correct_answer: params[:answer])
  if card.save
    redirect "/decks/#{current_deck.id}/cards/add"
  else
    @errors = card.errors.full_messages
    erb :'/decks/cards/new'
  end
end

get "/decks/:id/cards/add" do
  redirect '/404' if !login?
  erb :'decks/cards/add'
end

get "/decks/:id/cards/done" do
  redirect '/404' if !login?
  erb :'decks/cards/done'
end

put '/decks/:id' do
  redirect '/404' if !login?
  @deck = Deck.find(params[:id])

  erb :'decks/review'
end
