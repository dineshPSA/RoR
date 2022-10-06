class Post < ApplicationRecord
    extend FriendlyId
    friendly_id :title, use: :slugged
    

    has_one_attached :image
    belongs_to :user

    
    def should_generate_new_friendly_id?
        title_changed? || super
    end
end
