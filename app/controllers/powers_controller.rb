class PowersController < ApplicationController
  def index
    @powers = Power.all
  end

  def show
    find_power  
  end 

  def edit
    @heroines = Heroine.all
    find_power
  end 

  def update
    find_power.assign_attributes(power_params)
    @heroines = Heroine.all
    if @power.valid?
      @power.save
      redirect_to power_path(@power)
    else
      @errors = @power.errors.full_messages
      render :new 
    end 

  end 

  private
  def find_power
    @power = Power.find(params[:id])
  end

  def power_params
    params.require(:power).permit(:name, :description)
  end 



end
