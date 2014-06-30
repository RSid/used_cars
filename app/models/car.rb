class Car < ActiveRecord::Base
  validates :year, presence: true,
    numericality: { greater_than_or_equal_to: 1920 }
  validates :mileage, presence: true
  validates :manufacturer, presence: true
  validates :color, presence: true

  belongs_to :manufacturer
end
