class Plant < ApplicationRecord
    has_many :comments
    mount_uploader :plant_image, PlantImageUploader
end
