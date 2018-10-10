class UnavailableRangesController < ApplicationController
  before_action :authenticate_realtor!, only:[:new, :create]
  before_action :set_property, only:[:new, :create]

  def new
    @unavailable_range = UnavailableRange.new()
  end

  def create
    if @unavailable_range = @property.unavailable_ranges.create(unavailable_range_params)
      redirect_to property_unavailable_range_path(@property, @unavailable_range)
      flash[:success] = "Imóvel bloqueado no peíodo de #{@unavailable_range.format_start_date} a #{@unavailable_range.format_end_date} "
    else
      flash[:alert] = "Algo deu errado"
      render :new
    end
  end

  def show
    
  end
  
  private
  def unavailable_range_params
    params.require(:unavailable_range).permit( :description, :start_date, :end_date)
  end
  
  def set_property
    @property = Property.find(params[:property_id])
  end
end