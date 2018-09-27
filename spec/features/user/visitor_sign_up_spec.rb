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
end