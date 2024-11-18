class Item < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :category, :size, :condition, :price_per_day, :title, presence: true
end
