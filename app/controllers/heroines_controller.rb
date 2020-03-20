class HeroinesController < ApplicationController
  def index
    @heroines = Heroine.all
  end

  def show
    # @heroine = Heroine(params[:id])
  end
end
