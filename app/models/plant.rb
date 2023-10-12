class Plant < ApplicationRecord
    has_many :comments
    belongs_to :user
    mount_uploader :plant_image, PlantImageUploader
end
