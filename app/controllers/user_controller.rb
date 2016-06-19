get '/users/new' do
  if login? && !guest?
    redirect "/users/#{current_user.id}"
  else
    erb :'users/new'
  end
end

post '/users/new' do
  user = User.new(username:params[:username], email:params[:email], password:params[:password])
  if user.save
    session[:user_id] = user.id
    redirect "/users/#{session[:user_id]}"
  elsif
    @errors = user.errors.full_messages
    erb :'users/new'
  else
    redirect '/'
  end
end

get '/users/:id' do
  @user = User.find(session[:user_id])

  erb :'users/show'
end
