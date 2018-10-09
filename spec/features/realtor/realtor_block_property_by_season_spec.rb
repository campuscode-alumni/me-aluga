require 'rails_helper'

feature 'Realtor block proporty by season' do

  scenario 'Successfully' do 
    realtor = Realtor.create(email: 'corretor@mealuga.com', password: '12345678')

    region = Region.create(name: 'Copacabana')
    property_type = PropertyType.create(name: 'Casa')

    property = Property.create(title: 'CASA - COPACABANA-RJ PISCINA/WI-FI/PROX.PRAIA',
                                description: 'casa com ar cond./cozinha conjugada com sala, cama de casal,beliche e banheiro',
                                property_type: property_type, region: region, area: '120 m²', 
                                room_quantity: '3', accessibility: true, allow_pets: true, allow_smokers: false,
                                maximum_guests: '15', minimum_rent: '2', maximum_rent: '30', daily_rate: '300', realtor: realtor)
                              
    visit root_path
    click_on 'Acesso Corretor'
    
    fill_in 'E-mail', with: 'corretor@mealuga.com'
    fill_in 'Senha', with: '12345678'
    
    click_on 'Entrar como corretor'

    click_on 'Ver imóveis'
    click_on 'CASA - COPACABANA-RJ PISCINA/WI-FI/PROX.PRAIA'
    click_on 'Bloquear temporada'
    
    fill_in 'Descrição', with: 'Férias do dono da casa'
    fill_in 'Data inicial', with: '08/10/2018'
    fill_in 'Data final', with: '15/10/2018'

    expext(page).to have_css('p', text: 'Imóvel bloqueado no peíodo de 08/10/2018 a 15/10/2018')
    
  end
end