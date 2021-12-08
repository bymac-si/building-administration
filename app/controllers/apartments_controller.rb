class ApartmentsController < ApplicationController
  def index
    @apartments = Apartment.all.order(:building_id, :number)
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

  def show
    @apartment = Apartment.find(params[:id])
  end

  private

  def apartment_params
    params.require(:apartment).permit(:number, :building_id)
  end
end
