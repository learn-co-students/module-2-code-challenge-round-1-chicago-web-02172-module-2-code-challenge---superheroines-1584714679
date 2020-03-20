class PowersController < ApplicationController
  
  before_action :set_power, only: [:show, :edit, :update]
  before_action :set_heroines, only: :edit

  def index
    @powers = Power.all
  end

  def show
    @power = Power.find(params[:id])
  end

  def edit
  end

  def update
    @power.assign_attributes(power_params(:name, :description))

    # The below is a little hacky...
    # :heroine_ids comes back as an array of strings, first one is "" though...
    heroine_ids = params[:power][:heroine_ids]
    heroine_ids.shift  # Throw away the extra empty string
    heroine_ids = heroine_ids.map { |id_number| id_number.to_i }  # Convert strings to integers

    # Find each heroine by ID, and add to the power's list of heroines
    heroine_ids.each { |heroine_id| @power.heroines << Heroine.find(heroine_id) }
    
    if @power.save
      redirect_to power_path(@power)
    else
      set_heroines
      render :edit
    end
  end

  private

  def power_params(*args)
    params.require(:power).permit(*args)
  end

  def set_power
    @power = Power.find(params[:id])
  end

  def set_heroines
    @heroines = Heroine.order(:super_name)
  end

end
