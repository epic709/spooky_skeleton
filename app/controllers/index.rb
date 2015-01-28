enable :sessions

get '/' do
  if session[:user] != nil
    redirect to("/welcome")
  end
  erb :index
end

post '/' do
  session[:user] = User.authenticate(params[:email],params[:password])
  if session[:user] == nil
    redirect to("/")
  else redirect to("/welcome")
  end
end

get '/welcome' do
  if session[:user] == nil
    redirect to("/")
  end
  erb :welcome
end

post '/welcome' do
  session[:user] = nil
  redirect to("/")
end

get '/register' do
  erb :register
end

post '/register' do
  user = User.create(full_name: params[:name],email: params[:email],password: params[:password])
  redirect to ("/")
end