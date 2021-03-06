require 'rails_helper'

feature 'Admin view car model' do
  scenario 'and view list' do
    car_category = CarCategory.create!(name: 'Top', daily_rate: 200,
                                       car_insurance: 50, 
                                       third_party_insurance: 20)
    CarModel.create!(name: 'Ka', year: 2020, manufacturer: 'Ford', 
                     motorization: '1.0', car_category: car_category, 
                     fuel_type: 'Flex')
    CarModel.create!(name: 'Onix', year: 2021, manufacturer: 'Chevrolet',
                     motorization: '1.0', car_category: car_category,
                     fuel_type: 'Flex')

    visit root_path
    click_on 'Modelos de carro'

    expect(page).to have_content('Ka')
    expect(page).to have_content('Ford')
    expect(page).to have_content('2020')
    expect(page).to have_content('Onix')
    expect(page).to have_content('2021')
    expect(page).to have_content('Chevrolet')
    expect(page).to have_content('Top', count: 2)
    expect(page).to have_link('Voltar', href: root_path)
  end

  scenario 'and view details' do
    car_category = CarCategory.create!(name: 'Top', daily_rate: 200,
                                       car_insurance: 50, 
                                       third_party_insurance: 20)
    CarModel.create!(name: 'Ka', year: 2020, manufacturer: 'Ford', 
                     motorization: '1.0', car_category: car_category, 
                     fuel_type: 'Flex')
    CarModel.create!(name: 'Onix', year: 2021, manufacturer: 'Chevrolet',
                     motorization: '1.0', car_category: car_category,
                     fuel_type: 'Flex')

    visit root_path
    click_on 'Modelos de carro'
    click_on 'Ka - 2020'

    expect(page).to have_content('Ka')
    expect(page).to have_content('2020')
    expect(page).to have_content('Ford')
    expect(page).to have_content('1.0')
    expect(page).to have_content(car_category.name) # O mesmo que 'Top'
    expect(page).to have_content('Flex')
    expect(page).to have_link('Voltar', href: car_models_path)
    expect(page).not_to have_content('Onix')
    expect(page).not_to have_content('Chevrolet') # Uma segurana??a para ter informa????es do Onix
  end

  scenario 'and nothing is registered' do
    visit root_path
    click_on 'Modelos de carro'

    expect(page).to have_content('Nenhum modelo de carro cadastrado')
  end

  scenario 'and category is a link' do
    'No Show, categoria dever ser um link'
    car_category = CarCategory.create!(name: 'Top', daily_rate: 200,
                                       car_insurance: 50, 
                                       third_party_insurance: 20)
    CarModel.create!(name: 'Ka', year: 2020, manufacturer: 'Ford', 
                     motorization: '1.0', car_category: car_category, 
                     fuel_type: 'Flex')

    visit root_path
    click_on 'Modelos de carro'
    click_on 'Ka - 2020'
    click_on 'Top'

    expect(page).to have_content('Top')
    expect(page).to have_content('R$ 200,00')
    expect(page).to have_content('R$ 50,00')
    expect(page).to have_content('R$ 20,00')
  end
end

