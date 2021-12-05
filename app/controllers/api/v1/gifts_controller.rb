class Api::V1::GiftsController < Api::V1::GraphitiController
  def index
    gifts = GiftResource.all(params)
    respond_with(gifts)
  end

  def show
    gift = GiftResource.find(params)
    respond_with(gift)
  end

  def create
    gift = GiftResource.build(params)

    if gift.save
      render jsonapi: gift, status: :created
    else
      render jsonapi_errors: gift
    end
  end

  def update
    gift = GiftResource.find(params)

    if gift.update_attributes
      render jsonapi: gift
    else
      render jsonapi_errors: gift
    end
  end

  def destroy
    gift = GiftResource.find(params)

    if gift.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: gift
    end
  end
end
