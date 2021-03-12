class CreateEmployees < ActiveRecord::Migration[6.1]
  def change
    create_table :employees do |t|
      t.string :name, null: false
      t.date :birthdate, null: false
      t.string :project, null: false
      t.string :country, null: false
      t.string :role, null: false
      t.timestamps
    end
  end
end
