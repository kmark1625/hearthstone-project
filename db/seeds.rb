response = Unirest.get "https://omgvamp-hearthstone-v1.p.mashape.com/cards",
  headers:{
    "X-Mashape-Key" => "CcIQzHZDgpmshhUs82pdE4PdTyEBp1ame9LjsnNcRCOgl946rl"
  }

CARD_SETS = ["Basic", "Classic", "Naxxramas", "Goblins vs Gnomes", "Blackrock Mountain", "The Grand Tournament", "The League of Explorers"]
# CARD_SETS = ["Naxxramas"]

CARD_SETS.each do |card_set|
  data = response.body[card_set]
  data.each do |card_data|
    card = Card.new
    card.attributes = card_data.reject{ |k,v| !card.attributes.keys.member?(k.to_s) }
    if card.type != "Hero" && card.type != "Enchantment" && card.type != "Hero Power" && !card.cardId.include?("NAX") && !card.cardId.include?("t")
      card.save
    end
  end
end


# Create some test users
User.create(first_name: "Kevin", last_name: "Mark", email: "kmark@gmail.com", password: "hello")

