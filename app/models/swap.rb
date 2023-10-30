class Swap < ApplicationRecord
  belongs_to :user
  mount_uploader :swap_image
end
