class Api::V1::WishlistsController < Api::V1::GraphitiController
  def index
    wishlists = WishlistResource.all(params)
    respond_with(wishlists)
  end

  def show
    wishlist = WishlistResource.find(params)
    respond_with(wishlist)
  end

  def create
    wishlist = WishlistResource.build(params)

    if wishlist.save
      render jsonapi: wishlist, status: 201
    else
      render jsonapi_errors: wishlist
    end
  end

  def update
    wishlist = WishlistResource.find(params)

    if wishlist.update_attributes
      render jsonapi: wishlist
    else
      render jsonapi_errors: wishlist
    end
  end

  def destroy
    wishlist = WishlistResource.find(params)

    if wishlist.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: wishlist
    end
  end
end
