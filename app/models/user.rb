class User < ApplicationRecord

  mount_uploader :image, ImageUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         #has_many :movies
         has_many :comments
end
