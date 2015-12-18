get "/" do
  erb :index
end

get "/testing" do
  scrape_top_decks()
end
