class RemoveScoreColumnsFromMatches < ActiveRecord::Migration[7.1]
  def change
    remove_column :matches, :score_team1
    remove_column :matches, :score_team2
  end
end
