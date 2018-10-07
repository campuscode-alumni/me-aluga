class ProposalsController < ApplicationController
  before_action :authenticate_user!, only: [ :new, :create]
  before_action :authenticate_realtor!, only: [:index]
  before_action :authenticate_user_or_realtor!, only: [:show]
  before_action :set_property, only: [:create, :new, :show]

  def index
    @properties =  Property.where(realtor: current_realtor)
    @proposals = Proposal.where(property: @properties)
  end

  def show
    @proposal = Proposal.find(params[:id])
  end

  def new
    @proposal =  Proposal.new(property: @property)
  end

  def create
    @proposal = @property.proposals.new(params.require(:proposal).permit(:start_date, :end_date, :total_amount, 
                                    :total_guests, :purpose))
    @proposal.user = current_user                                                                

    @proposal.set_total_amount

    if @proposal.save
      flash[:success] = "Proposta enviada com sucesso."
      redirect_to property_proposal_path(@property, @proposal)
    else
      flash[:alert] = "Você deve preencher todos os campos da proposta."
      render :new
    end
  end

  def authenticate_user_or_realtor!
    user_signed_in? || realtor_signed_in?
  end
  def accepted
    @property = Property.find(params[:property_id])
    @proposal = Proposal.find(params[:proposal_id])
    @proposal.accepted!
    flash[:success] = 'Proposta aceita com sucesso.'
    redirect_to property_proposal_path(@property, @proposal)   

  end
  
  def set_property
    @property = Property.find(params[:property_id])
  end

  end 




