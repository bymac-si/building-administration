class ApartmentsController < ApplicationController

  before_action :set_apartment, only: [:show, :edit, :update, :destroy]

  def index
    @apartments = Apartment.all.includes(:building).order(:building_id, :number)   
  end

  def new
    @apartment = Apartment.new
    @buildings = Building.all
  end

  def create
    @apartment = Apartment.new(apartment_params)
    # Strong parameters, previene ataques de mass assignment
    respond_to do |format|
      if @apartment.save
        format.html {
          redirect_to @apartment, notice: "El Departamento fue creado correctamente."
        }
      else
        format.html { render :new }
      end
    end
  end
  
  def update
    if @apartment.update(apartment_params)
      redirect_to apartments_path
    else
      render :edit
    end
  end

  def edit
   @buildings = Building.all
  end

  def destroy
    if @apartment.destroy
      flash[:destroy] = "Departamento #{@apartment.number} eliminado"
    else
      flash[:destroy] = "No pudo eliminarse"
    end
    redirect_to apartments_path
    
  end

  def show
   
  end

 

  private

  def apartment_params
    params.require(:apartment).permit(:number, :building_id)
  end

  def set_apartment
    @apartment = Apartment.find(params[:id])
  end
end
