class PriceRange < ApplicationRecord
  belongs_to :property

  validates :description, :start_date, :end_date, :daily_rate, presence: {
             message: 'Você deve preencher todos os campos.'  }

  def period_formated
    "#{start_date.strftime('%d/%m/%Y')} a #{end_date.strftime('%d/%m/%Y')}"
  end
end
