require 'rails_helper'

feature 'Admin view car categories' do
  scenario 'successfully' do
    CarCategory.create!(name: 'Top', daily_rate: 105.5, car_insurance: 58.5,
                        third_party_insurance: 10.5)
    CarCategory.create!(name: 'Flex', daily_rate: 80, car_insurance: 8.5,
                        third_party_insurance: 8.5)

    visit root_path
    click_on 'Categorias'

    expect(page).to have_content('Top')
    expect(page).to have_content('Flex')
  end
end