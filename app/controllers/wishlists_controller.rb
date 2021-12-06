class WishlistsController < ApplicationController
  before_action :current_user_must_be_wishlist_user,
                only: %i[edit update destroy]

  before_action :set_wishlist, only: %i[show edit update destroy]

  def index
    @q = Wishlist.ransack(params[:q])
    @wishlists = @q.result(distinct: true).includes(:user,
                                                    :gifts).page(params[:page]).per(10)
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
      message = "Wishlist was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @wishlist, notice: message
      end
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
    message = "Wishlist was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to wishlists_url, notice: message
    end
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
