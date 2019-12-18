class Blog < ApplicationRecord
    enum status: { draft: 0, published: 1} #default is set to 0
    extend FriendlyId
    friendly_id :title, use: :slugged
end
