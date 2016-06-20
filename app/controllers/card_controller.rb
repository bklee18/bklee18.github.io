get '/cards/:id' do
  @card = Card.find(params[:id])
  redirect '/404' if !authorized_user?(@card)

  erb :'decks/cards/edit'
end

post '/cards/:id' do
  @card = Card.find(params[:id])
  redirect '/404' if !authorized_user?(@card)

  card = Card.find(params[:id])
  if !params[:question].match(/\A\s*\z/)
    card.question = params[:question]
    card.save!
  end
  if !params[:answer].match(/\A\s*\z/)
    card.correct_answer = params[:answer]
    card.save!
  end

  redirect "/decks/#{card.deck.id}/edit"
end
