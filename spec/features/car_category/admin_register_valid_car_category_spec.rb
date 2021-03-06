require 'rails_helper'

feature 'Admin register valid car category' do
  scenario 'and attributes cannot be blank' do
    visit root_path
    click_on 'Categorias'
    click_on 'Registrar uma nova categoria'
    # Não precisa preencher com valor em branco, pois o formulário já está com valor em branco
    # fill_in 'Nome', with: ''
    # fill_in 'Diária', with: ''
    # fill_in 'Seguro do carro', with: ''
    # fill_in 'Seguro para terceiros', with: ''
    click_on 'Enviar'

    expect(CarCategory.count).to eq 0
    expect(page).to have_content('não pode ficar em branco', count: 4)
  end

  scenario 'and name must be unique' do
    CarCategory.create!(name: 'Top', daily_rate: 105.5, car_insurance: 58.5,
                        third_party_insurance: 10.5)
    
    visit root_path
    click_on 'Categorias'
    click_on 'Registrar uma nova categoria'
    fill_in 'Nome', with: 'Top'
    fill_in 'Diária', with: '100'
    fill_in 'Seguro do carro', with: '50'
    fill_in 'Seguro para terceiros', with: '10'
    click_on 'Enviar'

    expect(page).to have_content('já está em uso')
  end
end

=begin

Por enquanto não será usado

  scenario 'Must be signed in' do
    # Arrange
  
    #Act
    visit root_path
    click_on 'Categorias'
  
    #Assert
    expect(current_path).to eq new_user_session_path
    expect(page).to have_content('Para continuar, faça login ou registre-se')
  end

  scenario 'and sign out' do
    #Arrange
    user = User.create!(name: 'greg', email: 'greg@email.com', 
                        password: '123456')
    login_as(user, scope: :user)

    #Act
    visit root_path
    click_on 'Sair'

    #Assert
    expect(page).not_to have_content(user)
    expect(page).not_to have_content('Sair')
    expect(page).to have_content('Logout efetuado com sucesso') 
    expect(page).to have_content('Entrar') 
  end
=end