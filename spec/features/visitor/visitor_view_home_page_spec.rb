require 'rails_helper'

feature 'visitor view home page' do
  scenario 'successfully' do

    region = Region.create(name: 'Copacabana')
    property_type = PropertyType.create(name: 'Casa')

    property = Property.create(title: 'CASA - COPACABANA-RJ PISCINA/WI-FI/PROX.PRAIA',
                                description: 'casa com ar cond./cozinha conjugada com sala, cama de casal,beliche e banheiro',
                                property_type: property_type, region: region, area: '120 m²', 
                                room_quantity: '3', accessibility: true, allow_pets: true, allow_smokers: false,
                                maximum_guests: '15', minimum_rent: '2', maximum_rent: '30', daily_rate: '300')
    
    region2 = Region.create(name: 'Leblon')
    property_type2 = PropertyType.create(name: 'Apartamento')

    property2 = Property.create(title: 'Apartamento com 1 dorm, 60m²',
                                  description: 'apto com ar cond./cozinha conjugada com sala, cama de casal, e banheiro',
                                  property_type: property_type2, region: region2, area: '60 m²', 
                                  room_quantity: '2', accessibility: true, allow_pets: false, allow_smokers: false,
                                  maximum_guests: '5', minimum_rent: '2', maximum_rent: '30', daily_rate: '500')
    
    visit root_path

    expect(page).to have_css('h1', text: property.region.name)
    within ".region#{region.id}" do
      expect(page).to have_css('h3', text: property.title)
      expect(page).to have_css('p', text: property.description)
      expect(page).to have_css('p', text: property.property_type.name )
      expect(page).to have_css('p', text: property.room_quantity)
      expect(page).to have_css('p', text: property.daily_rate)
    end

    expect(page).to have_css('h1', text: property2.region.name)
    within ".region#{region2.id}" do
      expect(page).to have_css('h3', text: property2.title)
      expect(page).to have_css('p', text: property2.description)
      expect(page).to have_css('p', text: property2.property_type.name )
      expect(page).to have_css('p', text: property2.room_quantity)
      expect(page).to have_css('p', text: property2.daily_rate)
    end
  end

  scenario 'and have no property in region' do
    
    region = Region.create(name: 'Leblon')

    visit root_path 

    expect(page).to have_css('h1', text: region.name)
    within ".region#{region.id}" do
      expect(page).to have_css('p', text: 'Ainda não há imóveis para esta região')
    end
  end

  scenario 'and have no region' do 

    visit root_path

    expect(page).to have_css('p', text: 'Ainda não há regiões cadastradas')
    
  end

  scenario 'and see datails of property' do

    region = Region.create(name: 'Copacabana')
    property_type = PropertyType.create(name: 'Casa')

    property = Property.create(title: 'CASA - COPACABANA-RJ PISCINA/WI-FI/PROX.PRAIA',
                                description: 'casa com ar cond./cozinha conjugada com sala, cama de casal,beliche e banheiro',
                                property_type: property_type, region: region, area: '120 m²', 
                                room_quantity: '3', accessibility: true, allow_pets: true, allow_smokers: false,
                                maximum_guests: '15', minimum_rent: '2', maximum_rent: '30', daily_rate: '300')
    
    
    
    visit root_path

    click_on 'CASA - COPACABANA-RJ PISCINA/WI-FI/PROX.PRAIA'

    expect(page).to have_css('h1', text: property.title)
    expect(page).to have_css('p', text: property.description)
    expect(page).to have_css('h3', text: 'Descrição do imóvel')    
 
  end
end