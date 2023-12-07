class Plant < ApplicationRecord
    has_many :comments, dependent: :destroy
    has_many :notes
    belongs_to :user
    mount_uploader :plant_image, PlantImageUploader
end
