get "/sessions/new" do
  erb :"/sessions/new"
end

post "/sessions" do
  if User.authenticate(params[:email], params[:password])
    session[:user_id] = User.find_by(email: params[:email]).id
    redirect "/"
  else
    @errors = "Sorry, the credentials do not match"
    erb:"sessions/new"
  end
end

get "/logout" do
  session[:user_id] = nil
  redirect "/"
end
