class Booking < ApplicationRecord
  validates :start_date, :end_date, presence: true
  belongs_to :item
  belongs_to :user
end
