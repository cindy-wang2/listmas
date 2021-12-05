class GiftsController < ApplicationController
  before_action :set_gift, only: [:show, :edit, :update, :destroy]

  # GET /gifts
  def index
    @gifts = Gift.page(params[:page]).per(10)
  end

  # GET /gifts/1
  def show
  end

  # GET /gifts/new
  def new
    @gift = Gift.new
  end

  # GET /gifts/1/edit
  def edit
  end

  # POST /gifts
  def create
    @gift = Gift.new(gift_params)

    if @gift.save
      message = 'Gift was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @gift, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /gifts/1
  def update
    if @gift.update(gift_params)
      redirect_to @gift, notice: 'Gift was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /gifts/1
  def destroy
    @gift.destroy
    message = "Gift was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to gifts_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gift
      @gift = Gift.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def gift_params
      params.require(:gift).permit(:wishlist, :giftname, :description)
    end
end
