require 'rails_helper'

feature 'salesperson adds a manufacturer', %Q(
  As a car salesperson
  I want to record a car manufacturer
  So that I can keep track of the types of cars found in the lot
) do

  scenario 'salesperson adds a manufacturer' do

    manufacturer = FactoryGirl.build(:manufacturer)

    visit new_manufacturer_path

    fill_in 'Name', with: manufacturer.name
    fill_in 'Country', with: manufacturer.country
    click_on 'Submit'

    expect(page).to have_content manufacturer.name
    expect(page).to have_content manufacturer.country
    expect(page).to have_content 'Manufacturer saved!'
  end

  scenario 'salesperson cannot add a manufacturer without a name' do

    manufacturer = FactoryGirl.build(:manufacturer)

    visit new_manufacturer_path

    fill_in 'Country', with: manufacturer.country
    click_on 'Submit'

    expect(page).to have_content 'Name can\'t be blank'
  end

  scenario 'salesperson cannot add a manufacturer without a country' do

    manufacturer = FactoryGirl.build(:manufacturer)

    visit new_manufacturer_path

    fill_in 'Name', with: manufacturer.name
    click_on 'Submit'

    expect(page).to have_content 'Country can\'t be blank'
  end
end
