class User < ApplicationRecord
  validates :name,
    presence: true,
    uniqueness: true,
    length: { maximum: 20,
               minimum: 2 }
  validates :introduction, length: { maximum: 50 }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :profile_image
  has_many :books, dependent: :destroy
end
