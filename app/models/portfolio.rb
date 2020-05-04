class Portfolio < ApplicationRecord
    has_many :technologies
    #using nested attributes in the model. only accept if attrs name is not blank
    accepts_nested_attributes_for :technologies, 
        allow_destroy: true,
        reject_if: lambda { |attrs| attrs['name'].blank? } 

    include Placeholder #using a concern
    validates_presence_of :title, :body, :main_image, :thumb_image

    def self.by_position
        order("position ASC")
    end
    # creating a custom scope (two ways to do this)
    # first way
    def self.angular
        where(subtitle: 'Angular')
    end
    # second way. 
    #-> is a lambda , {} is a block
    scope :ruby_on_rails_postfolio_items, -> {where(subtitle: 'Ruby on Rails')} #lamda here
    after_initialize :set_defaults

# ||= is saying if self.main_image is equal to nil, set self.main image to "http://placehold.it/600x400". use ||= instead of simply just =, because = will override.
    def set_defaults
        self.main_image ||= Placeholder.image_generator(height: '600', width: '400') #using a concern, placeholder.rb
        self.thumb_image ||= Placeholder.image_generator(height: '350', width: '200') #using a concern, placeholder.rb
    end
end
