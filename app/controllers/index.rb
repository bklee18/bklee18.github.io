get '/' do
  redirect "/login"
end

get '/login' do
  if login?
    redirect '/home'
  else
    erb :'marco/login'
  end
end

post  '/login' do
 @user = User.find_by(username: params[:username])
  if @user
    if @user.authenticate(params[:password])
      session[:user_id]=@user.id
      redirect '/'
    else
      @errors = "Incorrect password."
    end
  else
    @errors = 'No such username.'
  end
  erb :'marco/login'
end

get '/new' do
  if login?
    erb :'marco/home'
  else
    erb :'marco/new'
  end
end

post '/new' do
  user = User.new(username:params[:username], email:params[:email], password:params[:password])
  if user.save
    redirect '/'
  else
    @errors = user.errors.full_messages
    erb :'marco/new'
  end
end

get '/home' do
  erb :'marco/home'
end

get '/logout' do
 session.delete(:user_id)
 redirect '/'
end
