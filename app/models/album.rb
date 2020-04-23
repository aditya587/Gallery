class Album < ApplicationRecord
    paginates_per 2
    belongs_to :user
    has_many_attached :images

    acts_as_taggable_on :tags

    validates :title, presence: true
    validates :discription, presence: true


    def thumbnail input
        return self.images[input].variant(resize: '300x230!').processed
    end
end
