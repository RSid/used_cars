class CarsController < ApplicationController
  def index
    @cars = Car.all
  end

  def new
    @car = Car.new
  end

  def create
    @manufacturers = Manufacturer.all
    @car = Car.create(car_params)

    if @car.save
      flash[:notice] = 'Car saved!'
      redirect_to cars_path
    else
      flash[:notice] = 'Car could not be saved'
      render 'cars/new'
    end

  end

  private

  def car_params
    params.require(:car).permit(:year, :mileage, :manufacturer_id, :color,
      :description)
  end
end
