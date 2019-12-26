class Skill < ApplicationRecord
    include Placeholder #using a concern
    validates_presence_of :title, :utilized

    after_initialize :set_defaults

    def set_defaults
        self.badge ||= Placeholder.image_generator(height: '250', width: '250') #using a concern, placeholder.rb
    end
end
