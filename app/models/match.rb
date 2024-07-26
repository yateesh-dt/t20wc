require 'csv'

class Match < ApplicationRecord
  
  belongs_to :team1, class_name: 'Team'
  belongs_to :team2, class_name: 'Team'
  before_save :date_check

  def self.process_data(path)
    CSV.read(path, headers: true).map do |row|
      {
        date: row['date'],
        location: row['location'], 
        team1_id: row['team1_id'].to_i,
        team2_id: row['team2_id'].to_i,
        score_team1: row['score_team1'].to_i,
        score_team2: row['score_team2'].to_i
      }
    end
  end

  def self.push_data(path)
    data = process_data(path)
    data.each do |match_attributes|
      Match.create!(match_attributes)
    end
  end
  private
  def date_check
    if date.present? && date < Date.today
      errors[:base] << "Date cannot be in the past"
      throw(:abort)
    end
  end
end

