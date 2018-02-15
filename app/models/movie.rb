class Movie < ApplicationRecord
mount_uploader :image, ImageUploader

has_many :comments ,dependent: :destroy
has_many :views ,dependent: :destroy
validates :title, presence: true,uniqueness: true,
                    length: { minimum: 1 }
end
