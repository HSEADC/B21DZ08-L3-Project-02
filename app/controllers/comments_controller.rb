class CommentsController < ApplicationController
  # before_action :authenticate_user!, only: %i[ new edit create update destroy ]
  load_and_authorize_resource
  before_action :set_comment, only: %i[ show edit update destroy ]
  # before_action :set_plant, only: %i[ show new edit create update destroy ]

  def index
    @comment = Comment.all
  end

  # GET /comments/1 or /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @plant = Plant.find(params[:plant_id])
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments or /comments.json
  def create
    @plant = Plant.find(params[:plant_id])
    @comment = @plant.comments.new(comment_params)
    # @comment = @plant.comments.new(body: params[:comment][:body], user_id: current_user.id)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to admin_plant_url(@plant), notice: "Comment was successfully created." }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /comments/1 or /comments/1.json
  def update

    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to admin_plant_url(@comment.plant), notice: "Comment was successfully updated." }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1 or /comments/1.json
  def destroy
    @plant = @comment.plant
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to admin_plant_url(@plant), notice: "Comment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def set_plant
      @plant = Plant.friendly.find(params[:plant_id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:body).merge(user_id: current_user.id)
    end
end
