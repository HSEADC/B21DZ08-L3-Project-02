class Api::V1::PlantsController < Api::V1::ApplicationController
 
  def index
    @plants = Plant.all

    # render json: @plants.map { |plant| plant.api_as_json }
  end

  def show
    @plant = Plant.find(params[:id])
  end

  def create
    jti = request.headers['Authorization']

    puts "======="
    puts jti
    puts "======="

    user = User.find_by_jti(decrypt_payload[0]['jti'])
    @plant = user.plants.new(plant_params)
  # @profile = current_user.profile

      if @plant.save
        render json: @plant, status: :created
      else
        render json: @plant.errors, status: :unprocessable_entity 
      end
  
  end

  def plant_params
    params.require(:plant).permit(:name, :description, :plant_image, :tag_list, :category_list)
  end

end
