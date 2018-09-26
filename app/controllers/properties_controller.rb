class PropertiesController < ApplicationController
  before_action :set_property, only: [:show]

  def show; end

  def index
    @regions = Region.all

    #@property = Property.find()
  end 

  def new
    @property = Property.new
  end

  def create
    @property = Property.new(property_params)
    if @property.save
      flash[:success] = 'Imóvel cadastrado com sucesso'
      redirect_to @property
    else
      flash[:alert] = 'Você deve preencher todos os campos'
      render :new
    end
  end

  private

  def set_property
    @property = Property.find(params[:id])
  end

  def property_params
    params.require(:property).permit(:title, :description, :property_type_id,
                                     :region_id, :rent_purpose, :area,
                                     :room_quantity, :accessibility,
                                     :allow_pets, :allow_smokers,
                                     :maximum_guests, :minimum_rent,
                                     :maximum_rent, :daily_rate)
  end
end
