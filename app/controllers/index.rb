get '/' do
  erb :index
end

get '/sessions/login' do
  if login?
    redirect "/users/#{session[:user_id]}"
  else
    erb :'sessions/login'
  end
end

post '/sessions/login' do
 @errors = []
 @user = User.find_by(username: params[:username])
  if @user
    if @user.authenticate(params[:password])
      session[:user_id]=@user.id
      redirect "/users/#{session[:user_id]}"
    else
      @errors << "Incorrect password."
    end
  else
    @errors << 'No such username.'
  end
  erb :'sessions/login'
end

get '/users/new' do
  if login?
    erb :'users/show'
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

get '/sessions/logout' do
 session.delete(:user_id)
 redirect '/'
end

get '/users/:id' do
  @user = User.find(session[:user_id])

  erb :'users/show'
end
