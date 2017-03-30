class Listing < ApplicationRecord
	belongs_to :user
	has_many :reservations
	
	# Carrierwave
	mount_uploaders :images, ImageUploader
	mount_uploader :avatar, AvatarUploader
end
