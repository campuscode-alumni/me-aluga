class ProposalsController < ApplicationController
  #before_action :authenticate_user!, only: [:show, :new, :create]
  #before_action :authenticate_realtor!, only: [:index, :show]
  def index
    @properties =  Property.where(realtor: current_realtor)
    @proposals = Proposal.where(property: @properties)
  end

  def show
    @property = Property.find(params[:property_id])
    @proposal = Proposal.find(params[:id])
  end

  def new
    @property = Property.find(params[:property_id])
    @proposal =  Proposal.new(property: @property)
   
  end

  def create
      if user_signed_in?
              @property = Property.find(params[:property_id])
              
              @proposal = @property.proposals.new(params.require(:proposal).permit(:start_date, :end_date, :total_amount, 
                                              :total_guests, :purpose))
              @proposal.user = current_user                                                                
              @proposal.set_total_amount
          
            if @proposal.save
              flash[:success] = "Proposta enviada com sucesso."
              redirect_to property_proposal_path(@property, @proposal)
            else
              p @proposal.errors.full_messages
              flash[:alert] = "Você deve preencher todos os campos da proposta."
              render :new
            end
      else
           flash[:alert] = "Você deve estar logado"
      end   
  end

end
