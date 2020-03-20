class Heroine < ApplicationRecord
    has_many :heroine_powers
    has_many :powers, :through => :heroine_powers
end
