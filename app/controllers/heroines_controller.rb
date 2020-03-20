class HeroinesController < ApplicationController
  def index
    @heroines = Heroine.all
  end

  def new
    @heroine = Heroine.new
  end

  def show
    @heroine = Heroine.find(params[:id])
  end

  def create
    @heroine = Heroine.new(name: strong_params[:name], super_name:strong_params[:super_name])
    power = Power.find(strong_params[:powers])
    @heroine.powers << power
    if @heroine.save
      redirect_to heroine_path(@heroine)
    else
      render :new
    end
  end
  
  def strong_params
    params.require(:heroine).permit(:name, :super_name, :powers)
  end
end
