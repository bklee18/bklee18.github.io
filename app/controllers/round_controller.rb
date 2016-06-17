before do
  @round = current_round
end

get '/rounds/:id' do
  if current_round.guesses.length == 0
    @card = current_round.cards.shuffle.first
    session[:card_id] = @card.id
  end
  erb :'rounds/show'
end

post '/rounds/:id' do
  # raise params.inspect
  @card = Card.find(params[:card_id])
  if params[:answer] == @card.correct_answer
    input = true
  else
    input = false
  end
  Guess.create!(round: @round, card: @card, user: User.find(session[:user_id]), correct: input)
end
