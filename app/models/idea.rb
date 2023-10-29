class Idea < ApplicationRecord
  belongs_to :user
  mount_uploader :idea_image
end
