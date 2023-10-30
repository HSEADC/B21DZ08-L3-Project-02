class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable, :registerable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  has_many :comments
  has_many :notes
  has_many :plants
  has_many :ideas
  has_many :swaps
end
