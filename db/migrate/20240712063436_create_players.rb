class CreatePlayers < ActiveRecord::Migration[7.1]
  def change
    create_table :players do |t|
      t.string :name
      t.integer :age
      t.string :position
      t.references :team, type: :integer, null: false, foreign_key: true
    end
  end
end