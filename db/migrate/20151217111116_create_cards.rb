class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string  :cardId
      t.string  :name
      t.string  :cardSet
      t.string  :type
      t.integer :cost
      t.integer :health
      t.string  :text
      t.boolean :elite
      t.string  :img
      t.string  :imgGold
      t.string  :locale
      t.string  :playerClass

      t.timestamps
    end
  end
end
