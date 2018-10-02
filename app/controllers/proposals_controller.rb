class ProposalsController < ApplicationController
  def index
    @proposals =  Property.where(realtor: current_realtor)
  end

  
end