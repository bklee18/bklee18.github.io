get '/cards/:id' do
  redirect '/404' if !login?
  @card = Card.find(params[:id])

  erb :'decks/cards/edit'
end
