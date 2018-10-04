require 'rails_helper'

feature 'Realtor accept proposal' do

  scenario 'Successfully' do 

    region = Region.create(name: 'Copacabana')
    property_type = PropertyType.create(name: 'Casa')

    property = Property.create(title: 'CASA - COPACABANA-RJ PISCINA/WI-FI/PROX.PRAIA',
                                description: 'casa com ar cond./cozinha conjugada com sala, cama de casal,beliche e banheiro',
                                property_type: property_type, region: region, area: '120 m²', 
                                room_quantity: '3', accessibility: true, allow_pets: true, allow_smokers: false,
                                maximum_guests: '15', minimum_rent: '2', maximum_rent: '30', daily_rate: '300')
    proposal = property.proposals.create(start_date: '10/10/2018', end_date: '17/10/2018', total_guests: '5',
                                          purpose: 'Para passar as férias com a família')

    visit property_proposal_path(property, proposal)

    #logar corretor

    #click_on 'Ver propostas pendentes'

    #click_on proposal.title

    click_on 'Aceitar'

    expect(page).to have_content('Proposta aceita com sucesso.')
    within '#status' do
      expect(proposal.status).to eq :accecpted
      expect(page).to have_css('p', text: 'Proposta aceita.')
    end


    
  end

end