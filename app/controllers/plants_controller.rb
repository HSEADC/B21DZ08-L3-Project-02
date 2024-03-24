class PlantsController < ApplicationController
  load_and_authorize_resource
  before_action :set_plant, only: %i[ show edit update destroy toggle_like liked_by_user ]

  # GET /plants or /plants.json
  def index
    @plants = Plant.all
    # META
    @title = "Растения"
    # 
  end

  def by_tag
    @plants = Plant.tagged_with(params[:tag])
    render :index
  end

  # GET /plants/1 or /plants/1.json
  def show
    @plant = Plant.find(params[:id])
    @user = @plant.user
    if @plant && @plant.shelf
      @plants = @plant.shelf.plants
    else
      @plants = []
    end
  end

  # GET /plants/new
  def new
    @plant = Plant.new
  end

  # GET /plants/1/edit
  def edit
  end

  # plant /plants or /plants.json
  def create
    @plant = Plant.new(plant_params)
    @profile = current_user.profile

    respond_to do |format|
      if @plant.save
        format.html { redirect_to profile_url(@profile), notice: "Plant was successfully created." }
        format.json { render :show, status: :created, location: @plant }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @plant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /plants/1 or /plants/1.json
  def update
    respond_to do |format|
      if @plant.update(plant_params)
        format.html { redirect_to plant_url(@plant), notice: "Plant was successfully updated." }
        format.json { render :show, status: :ok, location: @plant }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @plant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plants/1 or /plants/1.json
  def destroy
    @plant.destroy
    @profile = current_user.profile

    respond_to do |format|
      format.html { redirect_to profile_url(@profile), notice: "Plant was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def toggle_like
    plant_user_ids = @plant.users_who_liked.pluck(:id)
  
    if plant_user_ids.include?(current_user.id)
      current_user.plants_i_liked.delete(@plant)
    else
      current_user.plants_i_liked << @plant
    end
  
    set_plant
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plant
      @plant = Plant.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def plant_params
      params.require(:plant).permit(:name, :description, :plant_image, :tag_list, :category_list, :shelf_id).merge(user_id: current_user.id)
    end
end
