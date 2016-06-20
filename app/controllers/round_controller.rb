get '/rounds/:id' do
  redirect '/404' if !Round.exists?(params[:id]) || !round_user?(params[:id])

  if round_win?
    @deck_name = current_round.deck.name
    @num_of_guesses = current_round.guesses.length
    @total_cards = current_round.cards.length
    @first_try = 0
    current_round.cards.each { |card| @first_try += 1 if card.guesses.length == 1 }
    session.delete(:round_id)
    session.delete(:deck_id)
    erb :'rounds/result'
  else
    round_card = shuffled_card
    while round_card_correctly_answered?(round_card)
      round_card = shuffled_card
    end
    @card = Card.find(round_card.id)
    erb :'rounds/show'
  end
end

post '/rounds/:id' do
  redirect '/404' if !Round.exists?(params[:id]) || !round_user?(params[:id])

  @card = Card.find(params[:card_id])
  if params[:answer].downcase == current_round.cards(params[:id]).find(params[:card_id]).correct_answer.downcase
      input = true
  else
    @correct = "#{current_round.cards(params[:id]).find(params[:card_id]).correct_answer}"
    input = false
  end
  Guess.create!(round: current_round, card: @card, user: current_user, correct: input)
  erb :'rounds/answer'
end
