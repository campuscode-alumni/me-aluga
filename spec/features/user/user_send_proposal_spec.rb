require 'rails_helper'

feature 'User send proposal' do

  scenario 'successfully' do

    region = Region.create(name: 'Copacabana')
    property_type = PropertyType.create(name: 'Casa')

    property = Property.create(title: 'CASA - COPACABANA-RJ PISCINA/WI-FI/PROX.PRAIA',
                                description: 'casa com ar cond./cozinha conjugada com sala, cama de casal,beliche e banheiro',
                                property_type: property_type, region: region, area: '120 m²', 
                                room_quantity: '3', accessibility: true, allow_pets: true, allow_smokers: false,
                                maximum_guests: '15', minimum_rent: '2', maximum_rent: '30', daily_rate: '300')

    visit root_path

    #Usuário loga

    click_on property.title

    click_on 'Enviar proposta'

    fill_in 'Início', with: "10/10/2018"
    fill_in 'Fim', with: "17/10/2018"
    fill_in 'Número de hóspedes', with: '5'
    fill_in 'Propósito', with: 'Para passar as férias com a família'  

    click_on 'Enviar'

    proposal = Proposal.last

    expect(current_path).to eq property_proposal_path(property, proposal)
    expect(page).to have_content("Proposta enviada com sucesso.")

    expect(page).to have_css('h1', text: 'Dados do imóvel')
    expect(page).to have_css('h3', text: property.title)
    expect(page).to have_css('p', text: property.description)
    expect(page).to have_css('p', text: property.property_type.name )
    expect(page).to have_css('p', text: property.room_quantity)
    expect(page).to have_css('p', text: 'R$ 300,00')
    
    expect(page).to have_css('h1', text: 'Proposta')

    expect(page).to have_css('h3', text: 'Início')
    expect(page).to have_css('p', text: '10/10/2018')

    expect(page).to have_css('h3', text: 'Fim')
    expect(page).to have_css('p', text: '17/10/2018')

    expect(page).to have_css('h3', text: 'Hóspedes')
    expect(page).to have_css('p', text: '5')
    
    expect(page).to have_css('h3', text: 'Propósito')
    expect(page).to have_css('p', text: 'Para passar as férias com a família')

    expect(page).to have_css('h3', text: 'Valor total')
    expect(page).to have_css('p', text: 'R$ 2100,00')

  end

end 