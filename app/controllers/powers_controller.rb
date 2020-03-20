class PowersController < ApplicationController
  def index
    @powers = Power.all
  end

  def show
    @power = Power.find(params[:id])
  end

  def edit
    @power = Power.find(params[:id])
  end

  def update
    @power = Power.find(params[:id])
    @power.assign_attributes(name:strong_params[:name], description:strong_params[:description])
    heroines = params[:power][:heroine_ids]
    heroines.shift
    heros = heroines.map {|h| Heroine.find(h.to_i)}
    @power.heroines << heros
    if @power.save
      redirect_to power_path(@power)
    else
      render :edit
    end
  end

  def strong_params
    params.require(:power).permit(:name, :description, heroine_ids:[])
  end

end
