class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :name, null: false
      t.decimal :price, null: false
      t.string :description, limit: 250
      t.string :author, limit: 30
      t.string :editor
      t.string :category, null: false
      t.timestamps
    end
  end
end
