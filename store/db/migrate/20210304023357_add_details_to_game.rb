class AddDetailsToGame < ActiveRecord::Migration[6.1]
  def change
    add_column :games, :name, :string, null: false
    add_column :games, :price, :decimal, null: false
    add_column :games, :description, :string, limit: 250
  end
end
