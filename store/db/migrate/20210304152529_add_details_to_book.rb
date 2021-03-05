class AddDetailsToBook < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :name, :string, null: false
    add_column :books, :price, :decimal, null: false
    add_column :books, :description, :string, limit: 250
    add_column :books, :author, :string, limit: 30
    add_column :books, :editor, :string
  end
end
