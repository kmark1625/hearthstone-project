def scrape_top_decks
  top_decks_doc = Nokogiri::HTML(open("http://www.hearthstonetopdecks.com/deck-category/style/meta-deck/"))
  deck_links = []
  deck_names = []
  top_decks = top_decks_doc.css("td:nth-child(2) a")
  top_decks.each do |deck|
    deck_links << deck['href']
    deck_names << deck.text
  end

  deck_links.each_with_index do |deck_link, index|
    scrape_one_deck(deck_link, deck_names[index])
  end
  return
end

def scrape_one_deck(deck_link, deck_name)
  new_deck = Deck.create(name: deck_name, user_id: 1)
  deck_doc = Nokogiri::HTML(open(deck_link))
  cards = deck_doc.css(".card-name")
  card_list = []
  cards.each do |card|
    card_list << card.text
    new_deck.cards << Card.find_by(name: card.text)
  end
end
