class HeroinesController < ApplicationController
  def index
    @heroines = Heroine.all
  end

  def show
    find_heroine
  end

  def new
    @heroine = Heroine.new
    @heroine.heroine_powers.build
  end

  def create
    @heroine = Heroine.new(heroine_params)
    if @heroine.valid?
      @heroine.save
      redirect_to heroine_path(@heroine)
    else
      render :new
    end
  end

  private

  def find_heroine
    @heroine = Heroine.find(params[:id])
  end

  def heroine_params
    params.require(:heroine).permit(:name, :super_name, { heroine_powers_attributes: [:power_id] })
  end
end
