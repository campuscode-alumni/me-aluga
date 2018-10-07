require 'rails_helper'

feature 'Realtor accept proposal' do

  scenario 'Successfully' do 
    user = User.create(name: 'Exemplo da Silva', email: 'exemplo@gmail.com', password: '12345678', document: '12345678910', phone: '1112345678')
    realtor = Realtor.create(email: 'corretor@mealuga.com', password: '12345678')
    region = Region.create(name: 'Copacabana')
    property_type = PropertyType.create(name: 'Casa')

    property = Property.create(title: 'CASA - COPACABANA-RJ PISCINA/WI-FI/PROX.PRAIA',
                                description: 'casa com ar cond./cozinha conjugada com sala, cama de casal,beliche e banheiro',
                                property_type: property_type, region: region, area: '120 m²', 
                                room_quantity: '3', accessibility: true, allow_pets: true, allow_smokers: false,
                                maximum_guests: '15', minimum_rent: '2', maximum_rent: '30', daily_rate: '300', realtor: realtor)
    
    
    proposal = property.proposals.create(start_date: '10/10/2018', end_date: '17/10/2018', total_guests: '5',
                                          purpose: 'Para passar as férias com a família', user: user)

    #visit property_proposal_path(property, proposal)

    #logar corretor
    visit root_path
    click_on 'Acesso Corretor'
    
    fill_in 'E-mail', with: 'corretor@mealuga.com'
    fill_in 'Senha', with: '12345678'
    
    click_on 'Entrar como corretor'

    click_on 'Propostas pendentes'

    click_on proposal.user.name

    click_on 'Aceitar'

    expect(page).to have_content('Proposta aceita com sucesso.')
    expect(page).not_to have_link('Aceitar')
    #expect(proposal.status).to eq :accepted
    within '#status' do     
      expect(page).to have_css('p', text: 'Proposta aceita.')
      #expect(page).to have_css('p', text: 'Hora de Atualuzação')
      expect(page).to have_content(proposal.updated_at.strftime('Atualizado em %d/%m/%Y às %H:%M'))
    end


    
  end

end