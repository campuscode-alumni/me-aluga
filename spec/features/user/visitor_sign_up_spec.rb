require 'rails_helper'

feature 'Visitor sign up' do
  scenario 'successfully' do
    visit root_path
    click_on 'Cadastre-se'
    
    fill_in 'E-mail', with: 'exemple@gmail.com'
    fill_in 'Senha', with: '12345678'
    click_on 'Cadastrar'

    expect(page).to have_css('Olá exemple@gmail.com')
  end
end