class BuildingsController < ApplicationController
  def index
    @buildings = Building.all
  end

  def new
    @building = Building.new
  end

  def create
    @building = Building.new(building_params)
    # Strong parameters, previene ataques de mass assignment
    respond_to do |format|
      if @building.save
        format.html {
          redirect_to @building, notice: "Building was successfully created."
        }
      else
        format.html { render :new }
      end
    end
  end

  def show
    @building = Building.find(params[:id])
    @apartments = Apartment.where(building_id: @building.id)
  end

  def solo_conce1
    @buildings = Building.where(city: "Concepcion")
  end

  def solo_santiago1
    @buildings = Building.where(city: "Santiago")
  end

  private

  def building_params
    params.require(:building).permit(:name, :address, :city)
  end
end
