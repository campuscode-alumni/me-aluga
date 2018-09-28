class ProposalsController < ApplicationController

  def new
    property = Property.find(params[:property_id])
    @proposal =  Proposal.new(property: property)
   
  end
  



end