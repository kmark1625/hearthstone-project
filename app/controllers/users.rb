get "/users/new" do
  erb :"users/new"
end

post "/users" do
  user = User.new(params[:user])
  user.avatar = Faker::Avatar.image(Faker::Lorem.word, "80x80")

  if user.save
    session[:user_id] = user.id
    redirect "/"
  end
end
