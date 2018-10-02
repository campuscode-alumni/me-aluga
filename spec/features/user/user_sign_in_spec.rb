require 'rails_helper'

feature 'User sign in' do
  scenario 'succesfully' do 
    
    user = User.create(email: 'teste@teste.com', password: '12345678',
                        name: 'Teste do Teste', document: '987654321', phone: '1140028922')

    visit root_path

    click_on 'Entrar'

    fill_in 'Email', with: 'teste@teste.com'
    fill_in 'Senha', with: '12345678'
    click_on 'Enviar'

    expect(current_path).to eq root_path
    expect(page).to have_content('Olá Teste do Teste')
    expect(page).not_to have_content('Entrar')
    expect(page).to have_content('Sair')

  end
end