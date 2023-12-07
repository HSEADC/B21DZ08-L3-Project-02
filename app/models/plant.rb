class Plant < ApplicationRecord
    has_many :comments, dependent: :destroy
    has_many :notes
    belongs_to :user
    mount_uploader :plant_image, PlantImageUploader

    def api_as_json
        {
        title: title,
        description: description
        pin_image: 'http://localhost:3000' + pin_image.url
        }
    end
end
