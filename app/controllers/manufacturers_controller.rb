class ManufacturersController < ApplicationController
  def index
    @manufacturers = Manufacturer.all
  end

  def new
    @manufacturer = Manufacturer.new
  end

  def create
    @manufacturer = Manufacturer.create(manufacturer_params)

    if @manufacturer.save
      flash[:notice] = 'Manufacturer saved!'
      redirect_to manufacturers_path
    else
      flash[:notice] = 'Manufacturer could not be saved'
      render new_manufacturers_path
    end

  end

  private

  def manufacturer_params
    params.require(:manufacturer).permit(:name, :country)
  end
end
