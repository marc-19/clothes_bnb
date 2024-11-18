class Item < ApplicationRecord
  belongs_to :user
  validates :category, :size, :condition, :price_per_day, :title, presence: true
end
