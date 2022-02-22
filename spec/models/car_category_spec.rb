require 'rails_helper'

describe CarCategory do
  context 'validation' do
    it 'attributes cannot be blank' do
      category = CarCategory.new

      category.valid?

      expect(category.errors[:name]).to include('não pode ficar em branco')
      expect(category.errors[:daily_rate]).to include('não pode ficar em '\
                                                      'branco')
      expect(category.errors[:third_party_insurance])
        .to include('não pode ficar em branco')
    end

    it 'name must be uniq' do
      CarCategory.create!(name: 'Top', daily_rate: 105.5, car_insurance: 58.5,
                          third_party_insurance: 10.5)
      category.valid?

      expect(category.errors[:name]).to include('já está em uso')
    end    
  end
end

=begin

 Por equanto não será usado
 
    it 'name uniqueness not case sensitive' do 
      CarCategory.create!(name: 'Top', daily_rate: 105,5, car_insurance: 58.5,
                          third_party_insurance: 10.5)
      category = CarCartegory.new(name: 'top')
    
      category.valid?
    
      expect(category.errors[:name]).to include('já está em uso')
    end

=end
