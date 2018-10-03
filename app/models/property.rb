class Property < ApplicationRecord
  belongs_to :property_type
  belongs_to :region
  has_many :proposal
  has_one_attached :image
  belongs_to :realtor
  validates :title, :room_quantity, :maximum_guests, :minimum_rent,
            :maximum_rent, :daily_rate,
            presence: { message: 'não pode ficar em branco' }
end
