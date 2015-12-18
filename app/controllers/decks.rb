get "/decks/new" do
  erb :"decks/new"
end

get "/decks" do
  @decks = Deck.all
  erb :"decks/show"
end

get "/decks/:id" do
  @deck = Deck.find_by(id: params[:id])
  erb :"decks/show_deck"
end

get "/decks/new/class/:class_name" do
  @class = params[:class_name]
  erb :"decks/deck_creation"
end
