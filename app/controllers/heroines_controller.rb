class HeroinesController < ApplicationController
  def index
    @heroines = Heroine.all
  end

  def show
    @heroine = Heroine.find(params[:id])
  end

  def new
    @heroine = Heroine.new
    @powers = Power.all
  end

  def create
    @heroine = Heroine.new(heroine_params)
    if @heroine.save
      redirect_to @heroine
    else
      @powers = Power.all
      render :new
    end
  end

  def edit
    @heroine = Heroine.find(params[:id])
  end

  def update
    @heroine = Heroine.find(params[:id])
    @heroine.update(heroine_params)
    redirect_to heroine_path(@heroine)
  end

  def destroy
    @heroine = Heroine.find(params[:id])
    @heroine.destroy
    p @heroine
    redirect_to heroines_path
  end

  private

  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end
end
