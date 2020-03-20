class Heroine < ApplicationRecord
    has_many :powers

    validates_presence_of :super_name, :name
end
