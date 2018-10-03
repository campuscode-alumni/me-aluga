require 'rails_helper'

feature 'realtor sees pending proposals' do
  scenario 'succesfully' do
    user = User.create(name: 'Exemplo da Silva', email: 'exemplo@gmail.com', password: '12345678', document: '12345678910', phone: '1112345678')
    realtor = Realtor.create(email: 'corretor@mealuga.com', password: '12345678')

    region = Region.create(name: 'Copacabana')
    property_type = PropertyType.create(name: 'Apartamento')

    property = Property.create( title: 'Lindo apartamento 100m da praia', maximum_guests: 15, minimum_rent: 1, maximum_rent: 20, daily_rate: '500',
      description: 'Um apartamento excelente para férias', property_type: property_type, region: region, area: 30,
      room_quantity: 2, allow_pets: true, allow_smokers: false, realtor: realtor)

    proposal = Proposal.create(property: property, start_date: '10/10/2018', end_date: '17/10/2018',  total_guests: 5, 
                                purpose: 'Para passar as férias com a família', user: user)
   


                      
    visit root_path
      
    click_on 'Acesso Corretor'
    
    fill_in 'E-mail', with: 'corretor@mealuga.com'
    fill_in 'Senha', with: '12345678'
    
    click_on 'Entrar'
    
    click_on 'Propostas pendentes'

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
    expect(page).to have_css('p', text: 'R$ 3500,00')
  end
end