class Card < ActiveRecord::Base
  self.inheritance_column = nil

  has_many :decks_cards
  has_many :decks, through: :decks_cards

  validates :name, uniqueness: true

  def self.select_set(set_name)
    Card.all.where(cardSet: set_name)
  end
end
