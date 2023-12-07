class Api::V1::PlantsController < Api::V1::ApplicationController
 
  def index
    @plants = Plant.all

    # render json: @plants.map { |plant| plant.api_as_json }
  end

  def show
    @plant = Plant.find(params[:id])
  end
end
