class CreateDecks < ActiveRecord::Migration
  def change
    create_table :decks do |t|
      t.string  :name, { null: false }
      t.string  :className
      t.integer :user_id

      t.timestamps
    end
  end
end
