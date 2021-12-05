class RelationshipsController < ApplicationController
  before_action :set_relationship, only: %i[show edit update destroy]

  def index
    @q = Relationship.ransack(params[:q])
    @relationships = @q.result(distinct: true).includes(:recipient,
                                                        :giftgiver).page(params[:page]).per(10)
  end

  def show; end

  def new
    @relationship = Relationship.new
  end

  def edit; end

  def create
    @relationship = Relationship.new(relationship_params)

    if @relationship.save
      message = "Relationship was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @relationship, notice: message
      end
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
    message = "Relationship was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to relationships_url, notice: message
    end
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
