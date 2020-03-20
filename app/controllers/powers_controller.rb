class PowersController < ApplicationController
  def index
    @powers = Power.all
  end

  def show
    find_power
  end

  def edit
    find_power
    @heroines = Heroine.all
  end
  
  def update
    find_power
    @power.update(power_params)
    redirect_to power_path(@power)
  end

  private

  def find_power
    @power = Power.find(params[:id])
  end

  def power_params
    params.require(:power).permit(:name, :description, :heroine_ids => [])
  end
end
