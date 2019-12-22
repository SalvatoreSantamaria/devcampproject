class Skill < ApplicationRecord
    validates_presence_of :title, :utilized
end
