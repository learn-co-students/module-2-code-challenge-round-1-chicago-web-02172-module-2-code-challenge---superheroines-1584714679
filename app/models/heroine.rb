class Heroine < ApplicationRecord
    has_many :heroine_powers
    has_many :powers, through: :heroine_powers

    validates_presence_of :name, :super_name
    validates_uniqueness_of :name, :super_name
end
