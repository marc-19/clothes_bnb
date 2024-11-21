class User < ApplicationRecord
  has_one_attached :avatar
  validates :first_name, :last_name, presence: true
  has_many :bookings, dependent: :destroy
  has_many :items, dependent: :destroy
  has_many :reviews, through: :bookings
  has_many :rentals
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  def full_name
    "#{first_name} #{last_name}".strip
  end
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
