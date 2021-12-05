class RelationshipsController < ApplicationController
  before_action :set_relationship, only: [:show, :edit, :update, :destroy]

  # GET /relationships
  def index
    @relationships = Relationship.all
  end

  # GET /relationships/1
  def show
  end

  # GET /relationships/new
  def new
    @relationship = Relationship.new
  end

  # GET /relationships/1/edit
  def edit
  end

  # POST /relationships
  def create
    @relationship = Relationship.new(relationship_params)

    if @relationship.save
      redirect_to @relationship, notice: 'Relationship was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /relationships/1
  def update
    if @relationship.update(relationship_params)
      redirect_to @relationship, notice: 'Relationship was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /relationships/1
  def destroy
    @relationship.destroy
    message = "Relationship was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to relationships_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_relationship
      @relationship = Relationship.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def relationship_params
      params.require(:relationship).permit(:your_giftgivers, :your_recipients, :relationshiptype)
    end
end
