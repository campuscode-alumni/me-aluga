require 'rails_helper'

feature 'realtor sees pending proposals' do
  scenario 'succesfully' do

    user = User.create(name: "Exemple da Silva", email: "exemple@yahoo.com",
                phone: "1123456789")

    Proposal.create(start_date: "10/10/2018" , end_date: "17/10/2018",
                     total_amount: 2.100, total_guests: 5, user: user, 
                     purpose: "Para passar as férias com a família" )

    visit root_path
    
    click_on 'Propostas pedentes'

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