class User < ApplicationRecord
  has_one_attached :avatar
  validates :first_name, :last_name, presence: true

  has_many :bookings, dependent: :destroy # Aluguéis feitos pelo usuário
  has_many :items, dependent: :destroy # Itens que o usuário disponibiliza para aluguel
  has_many :booked_items, through: :bookings, source: :item
  has_many :reviews, through: :bookings

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  def full_name
    "#{first_name} #{last_name}".strip
  end
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
