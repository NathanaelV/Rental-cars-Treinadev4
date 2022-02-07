require 'rails_helper'

feature 'Admin view subsidiary' do
  scenario 'successfully' do
    # Arrange
    Subsidiary.create!(name: 'Joao alugueis', cnpj: '123.456.789/0001-22', 
                       address: 'Rua dos bobos, n 0' )
    Subsidiary.create!(name: 'Splinter alugueis', cnpj: '444.444.444/0004-44', 
                       address: 'Av. esgostos de Nova York, n 4000')

    #Act
    visit root_path
    click_on 'Filiais'

    # Assert
    expect(current_path).to eq subsidiaries_path
    expect(page).to have_content('Joao alugueis')
    expect(page).to have_content('Splinter alugueis')
  end

  scenario 'and no subsidiaries are created' do
    visit root_path
    click_on 'Filiais'
    
    expect(page).to have_content('Nenhuma filial cadastrada')
  end

  scenario 'and view details' do
    Subsidiary.create!(name: 'Joao alugueis', cnpj: '123.456.789/0001-22', 
      address: 'Rua dos bobos, n 0' )
    Subsidiary.create!(name: 'Splinter alugueis', cnpj: '444.444.444/0004-44', 
      address: 'Av. esgostos de Nova York, n 4000')
    
    visit root_path
    click_on 'Filiais'
    click_on 'Joao alugueis'

    expect(page).to have_content('Joao alugueis')
    expect(page).to have_content('123.456.789/0001-22')
    expect(page).to have_content('Rua dos bobos, n 0')
    expect(page).not_to have_content('Splinter alugueis')
  end

  scenario 'and return to home page' do
    Subsidiary.create!(name: 'Splinter alugueis', cnpj: '444.444.444/0004-44', 
      address: 'Av. esgostos de Nova York, n 4000')

    visit root_path
    click_on 'Filiais'
    click_on 'Voltar'
    
    expect(current_path).to eq root_path
  end

  scenario 'and return to manufacturers page' do
    Subsidiary.create!(name: 'Splinter alugueis', cnpj: '444.444.444/0004-44', 
      address: 'Av. esgostos de Nova York, n 4000')

    visit root_path
    click_on 'Filiais'
    click_on 'Splinter alugueis'
    click_on 'Voltar'

    expect(current_path).to eq subsidiaries_path
  end

end

