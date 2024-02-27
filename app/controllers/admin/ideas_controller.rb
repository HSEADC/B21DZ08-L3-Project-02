class Admin::IdeasController < ApplicationController
  load_and_authorize_resource
  before_action :set_idea, only: %i[ show edit update destroy toggle_savedIdeas]

  # GET /ideas or /ideas.json
  def index
    @ideas = Idea.all
  end



  # GET /ideas/1 or /ideas/1.json
  def show
    
  end

  # GET /ideas/new
  def new
    @idea = Idea.new
  end

  # GET /ideas/1/edit
  def edit
  end

  # POST /ideas or /ideas.json
  def create
    @idea = Idea.new(idea_params)
    @profile = current_user.profile

    respond_to do |format|
      if @idea.save
        format.html { redirect_to profile_url(@profile), notice: "Idea was successfully created." }
        format.json { render :show, status: :created, location: @idea }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ideas/1 or /ideas/1.json
  def update
    respond_to do |format|
      if @idea.update(idea_params)
        format.html { redirect_to admin_idea_url(@idea), notice: "Idea was successfully updated." }
        format.json { render :show, status: :ok, location: @idea }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ideas/1 or /ideas/1.json
  def destroy
    @idea.destroy

    respond_to do |format|
      format.html { redirect_to admin_ideas_url, notice: "Idea was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  
  def toggle_savedIdeas
    idea_user_ids = []
  
    @idea.users.each do |user|
      idea_user_ids << user.id
    end
  
    if idea_user_ids.include?(current_user.id)
      current_user.savedIdeas.delete(@idea)
    else
      current_user.savedIdeas << @idea
    end

    set_idea
  
    respond_to do |format|
      format.turbo_stream
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_idea
      @idea = Idea.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def idea_params
      params.require(:idea).permit(:title, :body, :idea_image).merge(user_id: current_user.id)
    end
end
