class Proposal < ApplicationRecord
  belongs_to :property
  validates :start_date, :end_date, :total_guests, :purpose, 
              presence: { message: 'Você deve preencher todos os campos da proposta.' }

  enum status: [:pending, :accepted, :refused]
  
  def set_total_amount
    calculate_total_amount
  end

  

  private
  
  def calculate_total_amount
    if end_date.nil? || start_date.nil?
      self.total_amount = 0
    elsif end_date < start_date
      self.total_amount = 0
    else    
      self.total_amount = property.daily_rate * (end_date - start_date).to_i
    end
  end
end
