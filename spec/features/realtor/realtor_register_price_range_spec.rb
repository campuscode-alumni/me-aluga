require 'rails_helper'

feature 'Realtor register a Price Range' do 

  scenario 'Successfully' do 
    realtor = Realtor.create(email: 'corretor@mealuga.com', password: '12345678')
    region = Region.create(name: 'Copacabana')
    property_type = PropertyType.create(name: 'Casa')

    property = Property.create!(title: 'CASA - COPACABANA-RJ PISCINA/WI-FI/PROX.PRAIA',
                                description: 'casa com ar cond./cozinha conjugada com sala, cama de casal,beliche e banheiro',
                                property_type: property_type, region: region, area: '120 m²', 
                                room_quantity: '3', accessibility: true, allow_pets: true, allow_smokers: false,
                                maximum_guests: '15', minimum_rent: '2', maximum_rent: '30', daily_rate: '300', realtor: realtor)

    visit root_path    

    click_on 'Acesso Corretor'
    
    fill_in 'E-mail', with: 'corretor@mealuga.com'
    fill_in 'Senha', with: '12345678'
    
    click_on 'Entrar como corretor'

    click_on property.title
    
    click_on 'Cadastrar preço por temporada'

    fill_in 'Descrição', with: 'Natal'
    fill_in 'Início', with: '25/12/2018'
    fill_in 'Final', with: '01/01/2019'
    fill_in 'Diária', with: '500'

    click_on 'Enviar'

    expect(current_path).to eq property_path(property)
    expect(page).to have_content('Temporada cadastrada com sucesso.')
    
    expect(page).to have_css('h3', text: 'Preços por temporada')
    within '.temporada' do
      expect(page).to have_css('p', text: 'Natal')
      expect(page).to have_css('p', text: '25/12/2018 a 01/01/2019')
      expect(page).to have_css('p', text: 'R$ 500,00')
    end

  end

  scenario 'and must fill in all fields' do 
    realtor = Realtor.create(email: 'corretor@mealuga.com', password: '12345678')
    region = Region.create(name: 'Copacabana')
    property_type = PropertyType.create(name: 'Casa')

    property = Property.create!(title: 'CASA - COPACABANA-RJ PISCINA/WI-FI/PROX.PRAIA',
                                description: 'casa com ar cond./cozinha conjugada com sala, cama de casal,beliche e banheiro',
                                property_type: property_type, region: region, area: '120 m²', 
                                room_quantity: '3', accessibility: true, allow_pets: true, allow_smokers: false,
                                maximum_guests: '15', minimum_rent: '2', maximum_rent: '30', daily_rate: '300', realtor: realtor)

    visit root_path    

    click_on 'Acesso Corretor'
    
    fill_in 'E-mail', with: 'corretor@mealuga.com'
    fill_in 'Senha', with: '12345678'
    
    click_on 'Entrar como corretor'

    click_on property.title
    
    click_on 'Cadastrar preço por temporada'

    fill_in 'Descrição', with: ''
    fill_in 'Início', with: ''
    fill_in 'Final', with: ''
    fill_in 'Diária', with: ''

    click_on 'Enviar'

    expect(page).to have_content("Você deve preencher todos os campos.")    

  end

end