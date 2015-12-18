class CreateDecksCards < ActiveRecord::Migration
  def change
    create_table :decks_cards do |t|
      t.integer :card_id
      t.integer :deck_id

      t.timestamps
    end
  end
end
