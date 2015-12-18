class Deck < ActiveRecord::Base
  has_many :decks_cards
  has_many :cards, through: :decks_cards
  belongs_to :user
end
