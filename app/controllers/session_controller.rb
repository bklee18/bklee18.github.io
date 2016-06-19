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
