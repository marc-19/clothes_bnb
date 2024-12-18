class Item < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings, dependent: :destroy

  has_one_attached :image

  validates :category, :size, :condition, :price_per_day, :title, presence: true
  validates :price_per_day, numericality: { greater_than_or_equal_to: 0 }
end
