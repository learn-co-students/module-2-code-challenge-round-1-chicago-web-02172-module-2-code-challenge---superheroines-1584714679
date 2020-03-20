class HeroinesController < ApplicationController
  
  def index
    @heroines = Heroine.all
  end

  def show
    @heroine = Heroine.find(params[:id])
  end

  def new
    @heroine = Heroine.new
    set_powers
  end

  def create
    # The below is a bit of a workaround for how the data is coming in from the form
    @heroine = Heroine.new(heroine_params(:name, :super_name))  # Make a new Heroine with :name and :super_name
    power_id = params[:heroine][:powers]
    power = Power.find(power_id)  # Find the power by ID

    @heroine.powers << power  # Add the power to the Heroine's list of powers

    # Try to save the Heroine. If invalid, re-render the form
    if @heroine.save
      redirect_to heroine_path(@heroine)
    else
      set_powers
      render :new
    end
  end

  private

  def heroine_params(*args)
    params.require(:heroine).permit(*args)
  end

  def set_powers
    @powers = Power.order(:name)
  end

end
