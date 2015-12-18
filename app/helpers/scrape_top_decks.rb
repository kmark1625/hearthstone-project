def scrape_top_decks
  top_decks_doc = Nokogiri::HTML(open("http://www.hearthstonetopdecks.com/deck-category/style/meta-deck/"))
end
