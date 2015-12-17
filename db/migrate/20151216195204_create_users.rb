class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :first_name, { null: false, limit: 50 }
      t.string  :last_name, { null: false, limit: 50}
      t.string  :email, { null: false, limit: 50 }
      t.string  :password_hash, { null: false }
      t.string  :avatar

      t.timestamps null: false
    end
  end
end
