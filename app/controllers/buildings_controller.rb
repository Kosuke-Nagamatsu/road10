class BuildingsController < ApplicationController
  before_action :set_building, only: %i[ show edit update destroy ]
  def index
    @buildings = Building.all
  end
  def show
    @stations = @building.stations
  end
  def new
    @building = Building.new
    2.times { @building.stations.build }
  end
  def edit
    @building.stations.build
  end
  def create
    @building = Building.new(building_params)
    respond_to do |format|
      if @building.save
        format.html { redirect_to @building, notice: "Building was successfully created." }
        format.json { render :show, status: :created, location: @building }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @building.errors, status: :unprocessable_entity }
      end
    end
  end
  def update
    respond_to do |format|
      if @building.update(building_params)
        format.html { redirect_to @building, notice: "Building was successfully updated." }
        format.json { render :show, status: :ok, location: @building }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @building.errors, status: :unprocessable_entity }
      end
    end
  end
  def destroy
    @building.destroy
    respond_to do |format|
      format.html { redirect_to buildings_url, notice: "Building was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  private
  def set_building
    @building = Building.find(params[:id])
  end
  def building_params
    params.require(:building).permit(
      :name, :rent, :address, :age, :note,
      stations_attributes: [
        :id, :railway, :name, :walking_time, :building_id
      ]
    )
  end
end
