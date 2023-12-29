class Admin::SwapsController < ApplicationController
  load_and_authorize_resource
  before_action :set_swap, only: %i[ show edit update destroy ]

  # GET /swaps or /swaps.json
  def index
    @swaps = Swap.all
  end

  # GET /swaps/1 or /swaps/1.json
  def show
    @user = User.find(@swap.user_id)
  end

  # GET /swaps/new
  def new
    @swap = Swap.new
  end

  # GET /swaps/1/edit
  def edit
  end

  # POST /swaps or /swaps.json
  def create
    @swap = Swap.new(swap_params)

    respond_to do |format|
      if @swap.save
        format.html { redirect_to welcome_myswaps_url(@swap), notice: "Swap was successfully created." }
        format.json { render :show, status: :created, location: @swap }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @swap.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /swaps/1 or /swaps/1.json
  def update
    respond_to do |format|
      if @swap.update(swap_params)
        format.html { redirect_to admin_swap_url(@swap), notice: "Swap was successfully updated." }
        format.json { render :show, status: :ok, location: @swap }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @swap.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /swaps/1 or /swaps/1.json
  def destroy
    @swap.destroy

    respond_to do |format|
      format.html { redirect_to admin_swaps_url, notice: "Swap was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_swap
      @swap = Swap.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def swap_params
      params.require(:swap).permit(:title, :description, :swap_image).merge(user_id: current_user.id)
    end
end
