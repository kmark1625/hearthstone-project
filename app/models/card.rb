class Card < ActiveRecord::Base
  self.inheritance_column = nil

  validates :name, uniqueness: true

  def self.select_set(set_name)
    Card.all.where(cardSet: set_name)
  end
end
