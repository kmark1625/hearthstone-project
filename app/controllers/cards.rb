get "/cards" do
  @cards = Card.all
  erb :"cards/show"
end

get "/cards/:set_name" do
  @cards = Card.select_set(params[:set_name])
  erb :"/cards/show"
end
