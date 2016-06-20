get '/' do
  erb :index
end

get '/404' do
  erb :'404'
end

get '/session-viewer' do
  session.inspect
end
