class Idea < ApplicationRecord
  belongs_to :user
  mount_uploader :idea_image

  has_and_belongs_to_many :users
end
