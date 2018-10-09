class PriceRangesController < ApplicationController
  before_action :set_property, only: [:create, :new, :show]
  
  def new
    @price_range = PriceRange.new(property: @property)
  end 

  def create
    @price_range = @property.price_ranges.new(price_range_params)

    if @price_range.save
      flash[:success] = 'Temporada cadastrada com sucesso.'
      redirect_to @property
    else
      render 'new'
    end
  end

  private
  def set_property
    @property = Property.find(params[:property_id])
  end

  def price_range_params
    params.require(:price_range).permit(:description, :start_date, :end_date, :daily_rate)
  end
end 