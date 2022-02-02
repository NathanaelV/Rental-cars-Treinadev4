require 'rails_helper'

feature 'Visitor open home page' do 
  scenario 'successfully' do
    #3 As -> Arrange, Act    , Assert
    #3 as -> Prepara, Executa, Valida

    # Arrange

    # Act
    visit root_path
    click 'a.confirm'

    # Assert
    expect(page).to have_css('h1.title', text: 'Rental Cars')
    expect(page).to have_content('Bem-vindo ao sistema de gestão de locação')
  end
end
