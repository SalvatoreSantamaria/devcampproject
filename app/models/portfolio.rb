class Portfolio < ApplicationRecord
    validates_presence_of :title, :body, :main_image, :thumb_image

    # creating a custom scope (two ways to do this)
    # first way
    def self.angular
        where(subtitle: 'Angular')
    end
    # second way.
    #-> is a lambda , {} is a block
    scope :ruby_on_rails_postfolio_items, -> {where(subtitle: 'Ruby on Rails')}
end
