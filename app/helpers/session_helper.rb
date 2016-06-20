def login?
  User.exists?(session[:user_id])
end

def register_user
  redirect '/login' unless login?
end

def current_user
  if login?
    User.find(session[:user_id])
  end
end

def authorized_user?(args)
  if args[:card]
    card = args[:card]
    User.find(session[:user_id]) == card.deck.author
  elsif args[:deck]
    deck = args[:deck]
    User.find(session[:user_id]) == deck.author
  end
end

def guest_user(session_id)
  if User.find_by(username: "guest_user#{session_id}")
    guest = User.find_by(username: "guest_user#{session_id}")
  else
    guest = User.create!(username: "guest_user#{session_id}", email: "guest@briansflashcards.com", password: "brianisthirstypleasehelphim")
  end
    session[:user_id] = guest.id
end

def guest?
  if login?
    username = User.find(session[:user_id]).username
    username.match(/\Aguest_user.+/)
  end
end
