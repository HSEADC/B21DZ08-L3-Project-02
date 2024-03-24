class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable, :registerable
  include Devise::JWT::RevocationStrategies::JTIMatcher

  
  devise :database_authenticatable, :registerable,
            :recoverable, :rememberable, :validatable,
            :jwt_authenticatable, jwt_revocation_strategy: self

  has_many :comments
  has_many :notes
  has_many :plants
  has_many :ideas
  has_many :swaps
  has_many :shelves

  has_many :likes
  has_many :plants_i_liked, through: :likes, source: 'plant'

  has_and_belongs_to_many :savedIdeas, class_name: 'Idea', foreign_key: 'user_id'

  has_one :profile
  after_create :create_profile

  has_many :followships, foreign_key: :follower_id
  has_many :followers, through: :followships, source: :followee

  has_many :inverse_followships, foreign_key: :followee_id, class_name: 'Followship'
  has_many :following_users, through: :inverse_followships, source: :follower

  def create_profile
    Profile.create(user_id: id)
    # Profile.create(user_id: id, username: "test", about: "Люблю кактус")
  end
end
