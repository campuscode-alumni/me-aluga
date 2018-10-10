class UnavailableRange < ApplicationRecord
  belongs_to :property
  def format_start_date
    self.start_date.strftime("%d/%m/%Y")
  end
  def format_end_date
    self.end_date.strftime("%d/%m/%Y")
  end
end
