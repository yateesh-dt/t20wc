# app/models/team.rb
class Team < ApplicationRecord
    has_many :players, dependent: :destroy
    accepts_nested_attributes_for :players, allow_destroy: true

    has_many :home_matches, class_name: 'Match', foreign_key: 'team1_id'
    has_many :away_matches, class_name: 'Match', foreign_key: 'team2_id'
    validates :name, presence: true, uniqueness: true
    validates :country, presence: true
    validates :founded, presence: true, numericality: { greater_than: 1901 }
    validates :description, presence: true
end