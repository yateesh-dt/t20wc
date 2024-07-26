require 'csv'

class Match < ApplicationRecord
    scope :by_team1, ->(team1_id) { where(team1_id: team1_id) }
    scope :by_team2, ->(team2_id) { where(team2_id: team2_id) }
    scope :by_date_range, ->(start_date, end_date) { where(date: start_date..end_date) }
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

  validates :location, presence: true
  validates :date, presence: true
  validates :team1_id, presence: true
  validates :team2_id, presence: true

  private
  def date_check
    if date.present? && date < Date.today
      errors[:base] << "Date cannot be in the past"
      throw(:abort)
    end
  end
end

