class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_many :review, dependent: :destroy

  # Método para verificar se o aluguel ainda está ativo
  def active?
    end_date > Date.today
  end
end
