require  'rails_helper'

feature 'visitor cant view proposal' do
  scenario 'successfully' do
    user = User.create(name: 'Exemplo da Silva', email: 'exemplo@gmail.com', password: '12345678', document: '12345678910', phone: '1112345678')
    realtor = Realtor.create(email: 'corretor@mealuga.com', password: '12345678')

    region = Region.create(name: 'Copacabana')
    property_type = PropertyType.create(name: 'Apartamento')

    property = Property.create( title: 'Lindo apartamento 100m da praia', maximum_guests: 15, minimum_rent: 1, maximum_rent: 20, daily_rate: '500',
      description: 'Um apartamento excelente para férias', property_type: property_type, region: region, area: 30,
      room_quantity: 2, allow_pets: true, allow_smokers: false, realtor: realtor)

    proposal = Proposal.create(property: property, start_date: '10/10/2018', end_date: '17/10/2018',  total_guests: 5, 
                                purpose: 'Para passar as férias com a família', user: user)
    visit proposals_path

    expect(current_path).to eq(new_realtor_session_path)
  end
     
end
