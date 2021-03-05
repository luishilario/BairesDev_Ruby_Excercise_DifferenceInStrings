class AddNameToPlatform < ActiveRecord::Migration[6.1]
  def change
    add_column :platforms, :name, :string
  end
end
