def login?
  User.exists?(session[:user_id])
end

def register_user
  redirect '/login' unless login?
end

def current_user
  if login?
    User.find_by(id: session[:user_id])
  else

  end
end

def authorized_user?(card)
  User.find(session[:user_id]) == card.deck.author
end

def round?(id)
  Round.exists?(id)
end

def round_user?(id)
  if round?(id)
    if login?
      # binding.pry
      # Round.find(id).user.id == current_user.id
    end
  end
end
