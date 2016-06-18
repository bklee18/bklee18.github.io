before do
  @round = current_round
end

get '/rounds/:id' do
  # binding.pry
  if current_round.guesses.length == 0
    @card = current_round.cards.shuffle.first
    # session[:card_id] = @card.id
    erb :'rounds/show'
  elsif current_round.guesses.where(correct: true).length == current_round.cards.length
    erb :'rounds/result'
  else
    round_card_id = shuffle
    while Guess.where(round_id: current_round.id, card_id: round_card_id, correct: true).length > 0
      round_card_id = shuffle
    end
    @card = Card.find(round_card_id)
    erb :'rounds/show'
  end

end

# post '/rounds/:id' do
#   @card = Card.find(params[:card_id])

#   if params[:answer].downcase == @card.correct_answer.downcase
#     input = true
#   else
#     input = false
#   end
#   Guess.create!(round: @round, card: @card, user: current_user, correct: input)

#   redirect "/rounds/#{current_round.id}"
# end

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
