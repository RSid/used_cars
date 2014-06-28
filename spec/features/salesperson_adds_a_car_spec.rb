require 'rails_helper'

feature 'salesperson adds a car', %Q(
As a car salesperson
I want to record a newly acquired car
So that I can list it in my lot
) do

  scenario 'salesperson adds a car' do
    manufacturer = FactoryGirl.build(:manufacturer)
    car = FactoryGirl.build(:car)

    visit new_car_path

    fill_in 'Year', with: car.year
    fill_in 'Mileage', with: car.mileage
    fill_in 'Manufacturer', with: car.manufacturer
    fill_in 'Color', with: car.color
    fill_in 'Description', with: car.description
    click_on 'Submit'

    expect(page).to have_content car.year
    expect(page).to have_content car.mileage
    expect(page).to have_content car.manufacturer
    expect(page).to have_content car.color
    expect(page).to have_content car.description
  end
end
