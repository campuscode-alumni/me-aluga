class Proposal < ApplicationRecord

  belongs_to :user
  belongs_to :property
  belongs_to :user 
  validates :start_date, :end_date, :total_guests, :purpose, 
              presence: { message: 'Você deve preencher todos os campos da proposta.' }

  validates :user, uniqueness: { scope: :property,
                                 conditions: -> { where(status: :pending) },
                                 message: "Deve haver somente uma proposta de imóvel pedente por usuário." }
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
      self.total_amount = total_amount_by_day
    end
  end

  def total_amount_by_day
    total_price = 0

    (start_date .. (end_date - 1)).each do |day|
      price_range = property.price_ranges.where("start_date <= :date and end_date >= :date", date: day).maximum('daily_rate')
      
      if price_range.nil?
        total_price += property.daily_rate
      else
        total_price += price_range
       
      end
    end 
    
    total_price
    
  end

end
