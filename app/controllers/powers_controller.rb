class PowersController < ApplicationController
  def index
    @powers = Power.all
  end

  def show
    find_power
  end

  def edit
    find_power
    @power.heroine_powers.build
  end

  def update
    find_power
    @power.update_attributes(power_params)
    if power.valid?
      @power.save
      redirect_to power_path(@power)
    else
      render :edit
    end
  end

  private
  
  def find_power
    @power = Power.find(params[:id])
  end

  def power_params
    params.require(:power).permit(:name, :description, { heroine_powers_attributes: [:heroine_id] })
  end
end
