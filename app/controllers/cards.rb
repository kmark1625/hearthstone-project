get "/cards" do
  @cards = Card.all
  erb :"cards/show"
end
