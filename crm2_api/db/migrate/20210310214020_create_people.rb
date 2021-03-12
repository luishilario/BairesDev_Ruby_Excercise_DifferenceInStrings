class CreatePeople < ActiveRecord::Migration[6.1]
  def change
    create_table :people do |t|
      t.string :name, null: false
      t.integer :age, null: false
      t.string :type, null: false
      t.timestamps
    end
  end
end
