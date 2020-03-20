class Power < ApplicationRecord
    belongs_to :hero

    validates_presence_of :name, :description
end
