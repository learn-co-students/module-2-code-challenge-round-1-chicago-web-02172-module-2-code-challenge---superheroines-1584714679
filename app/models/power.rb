class Power < ApplicationRecord
    has_many :heroine_powers
    has_many :heroines, through: :heroine_powers

    def total_heroines
        heroines.count
    end

    def titleized_name
        name.titleize
    end
end
