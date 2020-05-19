class Topic < ApplicationRecord
    validates_presence_of :title

    has_many :blogs

    def self.with_blogs
        includes(:blogs).where.not(blogs: {id: nil })
        #can run this in terminal as Topic.includes(:blogs).where.not(blogs: {id: nil })
    end
end
