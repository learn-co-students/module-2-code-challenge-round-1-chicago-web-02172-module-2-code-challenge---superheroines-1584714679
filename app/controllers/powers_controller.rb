class PowersController < ApplicationController
  def index
    @powers = Power.all
  end

  def show
    @power = Power.find(params[:id])
  end

  def new
    @power = Power.new
    @heroines = Heroine.all
  end

  def create
    @power = Power.new(power_params)
    if @power.save
      redirect_to power_path(@power)
    else
      @heroines = Heroine.all
      render :new
    end
  end

  def edit
    @power = Power.find(params[:id])
    @heroines = Heroine.all
  end

  def update
    @power = Power.find(params[:id])
    @power.assign_attributes(power_params)
    if @power.save
      redirect_to power_path(@power)
    else
      render :edit
    end
  end

  private

  def power_params
    params.require(:power).permit(:name, :description)
  end

end
