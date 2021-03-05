class AddCategoryToBook < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :category, :string, null: false
  end
end
