class CreateMatches < ActiveRecord::Migration[7.1]
  def change
    create_table :matches do |t|
      t.date :date
      t.string :location
      t.integer :team1_id
      t.integer :team2_id
      t.integer :score_team1
      t.integer :score_team2
    end
  end
end
