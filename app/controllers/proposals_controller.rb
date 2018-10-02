class ProposalsController < ApplicationController

  def show
    @property = Property.find(params[:property_id])
    @proposal = Proposal.find(params[:id])
  end

  def new
    @property = Property.find(params[:property_id])
    @proposal =  Proposal.new(property: @property)
   
  end

  def create
    @property = Property.find(params[:property_id])
    @proposal = @property.proposals.new(params.require(:proposal).permit(:start_date, :end_date, :total_amount, 
                                    :total_guests, :purpose))
                                    
    @proposal.calculate_total_amount
   
    if @proposal.save
      flash[:success] = "Proposta enviada com sucesso."
      redirect_to property_proposal_path(@property, @proposal)
    end

  end 
  
end