class RelationshipsController < ApplicationController
  before_action :set_relationship, only: %i[show edit update destroy]

  def index
    @q = Relationship.ransack(params[:q])
    @relationships = @q.result(distinct: true).page(params[:page]).per(10)
  end

  def show; end

  def new
    @relationship = Relationship.new
  end

  def edit; end

  def create
    @relationship = Relationship.new(relationship_params)

    if @relationship.save
      redirect_to @relationship,
                  notice: "Relationship was successfully created."
    else
      render :new
    end
  end

  def update
    if @relationship.update(relationship_params)
      redirect_to @relationship,
                  notice: "Relationship was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @relationship.destroy
    redirect_to relationships_url,
                notice: "Relationship was successfully destroyed."
  end

  private

  def set_relationship
    @relationship = Relationship.find(params[:id])
  end

  def relationship_params
    params.require(:relationship).permit(:your_giftgivers, :your_recipients,
                                         :relationshiptype)
  end
end
