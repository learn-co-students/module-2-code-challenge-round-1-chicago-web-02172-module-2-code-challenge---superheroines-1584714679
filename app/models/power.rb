class Power < ApplicationRecord
    has_many :heroine_powers
    has_many :heroines, through: :heroine_powers

    def self.num_of_heroines_per_power
        # Power.all.map

    end 


end
