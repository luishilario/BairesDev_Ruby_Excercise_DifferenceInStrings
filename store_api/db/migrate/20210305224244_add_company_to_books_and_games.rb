class AddCompanyToBooksAndGames < ActiveRecord::Migration[6.1]
  def change
    add_reference :games, :company, foreign_key: true
    add_reference :books, :company, foreign_key: true
  end
end
