class Profile < ApplicationRecord
  belongs_to :user
  mount_uploader :profile_image, PlantImageUploader
  validates :username, uniqueness: true, on: :update
end
