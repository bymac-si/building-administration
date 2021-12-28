class BuildingsController < ApplicationController
before_action :set_building, only: [:show, :edit, :update, :destroy]

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
  def edit
    
  end
  def show
    @apartments = Apartment.where(building_id: @building.id)
  end

  def update
    if @building.update(building_params)
      redirect_to buildings_path
    else
      render :edit
    end  
  end

  def destroy
    if @building.destroy
      flash[:destroy] = "Edificio #{@building.name} eliminado"
    else
      flash[:destroy] = "No pudo eliminarse"
    end
    redirect_to buildings_path
  end

  private

  def building_params
    params.require(:building).permit(:name, :address, :city)
  end

  def set_building
    @building = Building.find(params[:id])
  end
end
