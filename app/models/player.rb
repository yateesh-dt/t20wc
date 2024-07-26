class Player < ApplicationRecord
    default_scope { where(is_active: true) }
    scope :with_role, -> (role) { where(role: role) }

    belongs_to :team
    
    # call back for Player should not be deleted if he/she is a captain, if captain send an alert or it can destroy
    before_destroy :check_captain
    after_create :increment_players_count
    after_destroy :decrement_players_count
    before_create :check_for_captain
    before_update :check_for_captain




    validates :name, presence: true
    validates :age, presence: true, numericality: { only_integer: true }
    validates :position, presence: true
    validates :team, presence: true
    validates :role, presence: true
    validates :is_captain, inclusion: { in: [true, false] }
    validates :is_active, inclusion: { in: [true, false] }
    validates :description, presence: true

    private
    def check_captain
        if self.is_captain == true
            errors.add(:base, "Player is a captain and cannot be deleted")
            throw :abort
        end
    end

    def increment_players_count
        self.team.increment!(:player_count)
    end

    def decrement_players_count
        self.team.decrement!(:player_count)
    end

    def check_for_captain
        if team.players.where(is_captain: true).exists? && is_captain
            errors[:base] << "Team already has a captain"
            throw(:abort)
        end
    end
end