class Plant < ApplicationRecord
    has_many :comments, dependent: :destroy
    has_many :notes
    belongs_to :user
    belongs_to :shelf

    has_many :likes
    has_many :users_who_liked, through: :likes, source: 'user'

    mount_uploader :plant_image, PlantImageUploader

    acts_as_taggable_on :tags
    acts_as_taggable_on :categories

    def api_as_json
        {
        title: title,
        description: description,
        plant_image: 'http://localhost:3000' + plant_image.url
        }
    end
end
