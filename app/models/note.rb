class Note < ApplicationRecord
    belongs_to :plant
    belongs_to :user
    mount_uploader :note_image
end
