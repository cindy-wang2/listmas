class WishlistsController < ApplicationController
  before_action :current_user_must_be_wishlist_recipient, only: [:edit, :update, :destroy] 

  before_action :set_wishlist, only: [:show, :edit, :update, :destroy]

  # GET /wishlists
  def index
    @wishlists = Wishlist.all
  end

  # GET /wishlists/1
  def show
    @gift = Gift.new
  end

  # GET /wishlists/new
  def new
    @wishlist = Wishlist.new
  end

  # GET /wishlists/1/edit
  def edit
  end

  # POST /wishlists
  def create
    @wishlist = Wishlist.new(wishlist_params)

    if @wishlist.save
      message = 'Wishlist was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @wishlist, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /wishlists/1
  def update
    if @wishlist.update(wishlist_params)
      redirect_to @wishlist, notice: 'Wishlist was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /wishlists/1
  def destroy
    @wishlist.destroy
    message = "Wishlist was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to wishlists_url, notice: message
    end
  end


  private

  def current_user_must_be_wishlist_recipient
    set_wishlist
    unless current_user == @wishlist.recipient
      redirect_back fallback_location: root_path, alert: "You are not authorized for that."
    end
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_wishlist
      @wishlist = Wishlist.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def wishlist_params
      params.require(:wishlist).permit(:user)
    end
end
