class HeroinesController < ApplicationController
  def index
    @heroines = Heroine.all
  end

  def new
    @heroine = Heroine.new
    set_powers
  end

  def create
    @heroine = Heroine.new(heroine_params)

    if @heroine.save
      redirect_to heroine_path(@heroine)
    else
      @errors = @heroine.errors.full_messages
      set_powers
      render :new
    end
  end

  def show
    @heroine = Heroine.find(params[:id])
  end

  private

  def set_powers
    @powers = Power.all
  end

  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_ids)
  end
end
