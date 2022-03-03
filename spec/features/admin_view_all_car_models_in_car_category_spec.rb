require 'rails_helper'

feature 'Admin view all car models in car category' do
  scenario 'successfully' do
    car_category = CarCategory.create!(name: 'Top', daily_rate: 200,
                                       car_insurance: 50, 
                                       third_party_insurance: 20)
    car_category_2 = CarCategory.create!(name: 'Topzera', daily_rate: 400,
                                         car_insurance: 100, 
                                         third_party_insurance: 40)
    CarModel.create!(name: 'Ka', year: 2020, manufacturer: 'Ford', 
                     motorization: '1.0', car_category: car_category, 
                     fuel_type: 'Flex')
    CarModel.create!(name: 'Onix', year: 2021, manufacturer: 'Chevrolet',
                     motorization: '1.0', car_category: car_category,
                     fuel_type: 'Flex')
    CarModel.create!(name: 'Corolla', year: 2022, manufacturer: 'Toyota',
                     motorization: '2.0', car_category: car_category_2,
                     fuel_type: 'Flex - Hibrido')

    visit root_path
    click_on 'Categorias'
    click_on 'Top'

    expect(page).to have_content('Ka')
    expect(page).to have_content('2020')
    expect(page).to have_content('Ford')
    expect(page).to have_content('1.0')
    expect(page).to have_content('Top', count: 3)
    expect(page).to have_content('Flex', count: 2)
    expect(page).to have_content('Onix')
    expect(page).to have_content('2021')
    expect(page).to have_content('Chevrolet')
    expect(page).to have_content('1.0')
    expect(page).not_to have_content('Corolla')
    expect(page).not_to have_content('Toyota')
  end
end

