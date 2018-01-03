class Movie < ApplicationRecord
mount_uploader :image, ImageUploader


has_many :comments
has_many :views
validates :title, presence: true,
                    length: { minimum: 1 }

end
