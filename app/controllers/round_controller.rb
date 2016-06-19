before do
  @round = current_round
end

get '/rounds/:id' do
  redirect '/404' if !Round.exists?(params[:id])
  redirect '/404' if round_user?(params[:id])
  if current_round.guesses.where(correct: true).length == current_round.cards.length
    @deck_name = current_round.deck.name
    @num_of_guesses = current_round.guesses.length
    @total_cards = current_round.cards.length
    @first_try = 0
    current_round.cards.each { |card| @first_try += 1 if card.guesses.length == 1 }
    session.delete([:round_id])
    erb :'rounds/result'
  else
    round_card = shuffled_card
    while Guess.where(round_id: current_round.id, card_id: round_card.id, correct: true).length > 0
      round_card = shuffled_card
    end
    @card = Card.find(round_card.id)
    erb :'rounds/show'
  end
end

post '/rounds/:id' do
  @card = Card.find(params[:card_id])
  if params[:answer].downcase != @round.cards(params[:id]).find(params[:card_id]).correct_answer.downcase
    @correct = "#{@round.cards(params[:id]).find(params[:card_id]).correct_answer}"
    input = false
  else
    input = true
  end
  Guess.create!(round: @round, card: @card, user: current_user, correct: input)
  erb :'rounds/answer'
end
