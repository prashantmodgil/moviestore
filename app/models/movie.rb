class Movie < ApplicationRecord
mount_uploader :image, ImageUploader
belongs_to :user
has_many :comments
has_many :views
validates :title, presence: true,
                    length: { minimum: 1 }
validates :rating, numericality: { less_than_or_equal_to: 10 }
end
