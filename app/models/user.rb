class User < ApplicationRecord

  mount_uploader :image, ImageUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         :confirmable
         #has_many :movies

has_many :comments ,dependent: :destroy
    #     after_create :send_admin_mail
#  def send_admin_mail
#    UserMailer.welcome_email(self).deliver_now
  #end
end
