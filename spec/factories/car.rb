FactoryGirl.define do
  factory :car do
    year '1976'
    mileage '3000'
    color 'red'
    description 'Cherry-red Mustang convertible'

    manufacturer
  end
end
