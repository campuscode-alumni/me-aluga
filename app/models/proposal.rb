class Proposal < ApplicationRecord
  belongs_to :property

  def calculate_total_amount
    self.total_amount = property.daily_rate * (end_date - start_date).to_i
  end
end
