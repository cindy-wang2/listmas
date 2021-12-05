class Api::V1::RelationshipsController < Api::V1::GraphitiController
  def index
    relationships = RelationshipResource.all(params)
    respond_with(relationships)
  end

  def show
    relationship = RelationshipResource.find(params)
    respond_with(relationship)
  end

  def create
    relationship = RelationshipResource.build(params)

    if relationship.save
      render jsonapi: relationship, status: :created
    else
      render jsonapi_errors: relationship
    end
  end

  def update
    relationship = RelationshipResource.find(params)

    if relationship.update_attributes
      render jsonapi: relationship
    else
      render jsonapi_errors: relationship
    end
  end

  def destroy
    relationship = RelationshipResource.find(params)

    if relationship.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: relationship
    end
  end
end
