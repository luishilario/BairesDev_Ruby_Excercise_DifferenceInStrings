class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.string :name, null: false
      t.decimal :price, null: false
      t.string :description, limit: 250
      t.timestamps
    end
  end
end
