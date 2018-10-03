class ProposalsController < ApplicationController
  def index
    @properties =  Property.where(realtor: current_realtor)
    @proposals = Proposal.where(property: @properties)
  end
end