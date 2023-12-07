class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable, :registerable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :comments
  has_many :notes
  has_many :plants
  has_many :ideas
  has_many :swaps

  has_one :profile
  after_create :create_profile

  def create_profile
    Profile.create(user_id: id)
    # Profile.create(user_id: id, username: "test", about: "Люблю кактус")
  end
end
