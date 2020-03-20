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
      redirect_to @power.heroine
    else
      @heroines = Heroine.all
      render :new
    end
  end

  def edit
    @power = Power.find(params[:id])
  end

  def update
    @power = Power.find(params[:id])
    @power.update(power_params)
    redirect_to @power.heroine
  end

  def destroy
    @power = Power.find(params[:id])
    @power.destroy
    p @power
    redirect_to powers_path
  end

  private

  def power_params
    params.require(:power).permit(:name, :description)
  end
end
