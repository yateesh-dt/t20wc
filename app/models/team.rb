# app/models/team.rb
class Team < ApplicationRecord
    has_many :players

    validates :name, presence: true, uniqueness: true
    validates :country, presence: true
    validates :founded, presence: true, numericality: { greater_than: 1901 }
    validates :description, presence: true
end