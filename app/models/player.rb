class Player < ApplicationRecord
    belongs_to :team

    validates :name, presence: true
    validates :age, presence: true, numericality: { only_integer: true }
    validates :position, presence: true
    validates :team, presence: true
    validates :role, presence: true
    validates :is_captain, inclusion: { in: [true, false] }
    validates :is_active, inclusion: { in: [true, false] }
    validates :description, presence: true
end