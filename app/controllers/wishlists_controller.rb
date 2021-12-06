class WishlistsController < ApplicationController
  before_action :current_user_must_be_wishlist_user,
                only: %i[edit update destroy]

  before_action :set_wishlist, only: %i[show edit update destroy]

  def index
    @wishlists = [current_user.wishlist]
  end

  def show
    @gift = Gift.new
  end

  def new
    @wishlist = Wishlist.new
  end

  def edit; end

  def create
    @wishlist = Wishlist.new(wishlist_params)

    if @wishlist.save
      redirect_to @wishlist, notice: "Wishlist was successfully created."
    else
      render :new
    end
  end

  def update
    if @wishlist.update(wishlist_params)
      redirect_to @wishlist, notice: "Wishlist was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @wishlist.destroy
    redirect_to wishlists_url, notice: "Wishlist was successfully destroyed."
  end

  private

  def current_user_must_be_wishlist_user
    set_wishlist
    unless current_user == @wishlist.user
      redirect_back fallback_location: root_path,
                    alert: "You are not authorized for that."
    end
  end

  def set_wishlist
    @wishlist = Wishlist.find(params[:id])
  end

  def wishlist_params
    params.require(:wishlist).permit(:user_id, :recipient)
  end
end
