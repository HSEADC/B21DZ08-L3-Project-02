class Admin::NotesController < ApplicationController
  load_and_authorize_resource
  before_action :set_note, only: %i[ show edit update destroy ]

  # GET /notes or /notes.json
  def index
    @notes = Note.all
  end

  # GET /notes/1 or /notes/1.json
  def show
  end

  # GET /notes/new
  def new
    @plant = Plant.find(params[:plant_id])
    @note = Note.new
  end

  # GET /notes/1/edit
  def edit
  end

  # POST /notes or /notes.json
  def create
    @plant = Plant.find(params[:plant_id])
    @note = @plant.notes.new(note_params)

    respond_to do |format|
      if @note.save
        format.html { redirect_to admin_plant_url(@plant), notice: "Note was successfully created." }
        format.json { render :show, status: :created, location: @note }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notes/1 or /notes/1.json
  def update
    respond_to do |format|
      if @note.update(note_params)
        format.html { redirect_to admin_note_url(@note), notice: "Note was successfully updated." }
        format.json { render :show, status: :ok, location: @note }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1 or /notes/1.json
  def destroy
    @plant = @note.plant
    @note.destroy

    respond_to do |format|
      format.html { redirect_to admin_notes_url, notice: "Note was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @plant = Plant.find(params[:plant_id])
    end

    def set_plant
      @plant = Plant.find(params[:plant_id])
    end

    # Only allow a list of trusted parameters through.
    def note_params
      params.require(:note).permit(:date, :title, :body, :note_image).merge(user_id: current_user.id)
    end
end
