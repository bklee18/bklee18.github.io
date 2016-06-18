def login?
  User.exists?(session[:user_id])
end

def register_user
  redirect '/login' unless login?
end

def current_user
  User.find_by(id:session[:user_id])
end
