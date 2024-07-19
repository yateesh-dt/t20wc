class AddNewColumnsToPlayers < ActiveRecord::Migration[7.1]
  def change    
    add_column :players, :is_captain, :boolean, null: false, default: false
    add_column :players, :is_active, :boolean, null: false, default: true
    add_column :players, :role, :string, null: false, default: "allrounder"
    add_column :players, :description, :text  

    enum :role, %w(allrounder bowler batsman)
  end
end
