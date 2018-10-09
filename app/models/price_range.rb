class PriceRange < ApplicationRecord
  belongs_to :property

  def period_formated
    "#{start_date.strftime('%d/%m/%Y')} a #{end_date.strftime('%d/%m/%Y')}"
  end
end
