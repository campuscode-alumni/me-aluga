require 'rails_helper'

feature 'Visitor sign up' do
  scenario 'successfully' do
    visit root_path
    click_on 'Cadastre-se'
    
    fill_in 'E-mail', with: 'exemple@gmail.com'
    fill_in 'Senha', with: '12345678'
    fill_in 'Confirme sua senha', with: '12345678'
    fill_in 'Nome', with: 'Exemplo da Silva'
    fill_in 'Documento', with: '12345678910'
    fill_in 'Telefone', with: '1112345678'
    click_on 'Cadastrar'

    expect(page).to have_content('Olá exemple@gmail.com')
    user = User.last
    expect(user.name).to eq("Exemplo da Silva")
    expect(user.document).to eq("12345678910")
    expect(user.phone).to eq("1112345678")
  end

  scenario 'Visitor do not insert data in fields' do
    visit root_path
    click_on 'Cadastre-se'

    fill_in 'E-mail', with: ''
    fill_in 'Senha', with: ''
    fill_in 'Confirme sua senha', with: ''
    fill_in 'Nome', with: ''
    fill_in 'Documento', with: ''
    fill_in 'Telefone', with: ''
    click_on 'Cadastrar'
    
    expect(page).to have_content('Please review the problems below:')
    expect(page).to have_content('Email can\'t be blank')
    expect(page).to have_content('Password can\'t be blank')
    expect(page).to have_content('Name can\'t be blank')
    expect(page).to have_content('Document can\'t be blank')



  end
end