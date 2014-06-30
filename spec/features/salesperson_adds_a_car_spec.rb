require 'rails_helper'

feature 'salesperson adds a car', %Q(
As a car salesperson
I want to record a newly acquired car
So that I can list it in my lot
) do

  scenario 'salesperson adds a car' do
    manufacturer = FactoryGirl.build(:manufacturer)

    visit new_manufacturer_path

    fill_in 'Name', with: manufacturer.name
    fill_in 'Country', with: manufacturer.country
    click_on 'Submit'

    car = FactoryGirl.build(:car, manufacturer: manufacturer)

    visit new_car_path

    fill_in 'Year', with: car.year
    fill_in 'Mileage', with: car.mileage
    select(car.manufacturer.name, from: 'car_manufacturer_id')
    fill_in 'Color', with: car.color
    fill_in 'Description', with: car.description
    click_on 'Submit'

    expect(page).to have_content car.year
    expect(page).to have_content car.mileage
    expect(page).to have_content car.manufacturer.name
    expect(page).to have_content car.color
    expect(page).to have_content car.description
    expect(page).to have_content 'Car saved!'
  end

  scenario 'salesperson adds a car without description' do
    manufacturer = FactoryGirl.build(:manufacturer)

    visit new_manufacturer_path

    fill_in 'Name', with: manufacturer.name
    fill_in 'Country', with: manufacturer.country
    click_on 'Submit'

    car = FactoryGirl.build(:car, manufacturer: manufacturer)

    visit new_car_path

    fill_in 'Year', with: car.year
    fill_in 'Mileage', with: car.mileage
    select(car.manufacturer.name, from: 'car_manufacturer_id')
    fill_in 'Color', with: car.color
    click_on 'Submit'

    expect(page).to have_content car.year
    expect(page).to have_content car.mileage
    expect(page).to have_content car.manufacturer.name
    expect(page).to have_content car.color
  end

  scenario 'salesperson tries to add a blank car' do

    visit new_car_path

    click_on 'Submit'

    expect(page).to have_content 'Year can\'t be blank'
    expect(page).to have_content 'Year is not a number'
    expect(page).to have_content 'Mileage can\'t be blank'
    expect(page).to have_content 'Color can\'t be blank'

  end
end
