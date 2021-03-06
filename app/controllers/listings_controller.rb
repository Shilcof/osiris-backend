class ListingsController < ApplicationController
  skip_before_action :authorized, only: [:index, :show]
  before_action :set_listing, only: [:show, :update, :destroy]

  # GET /listings
  def index
    page_number = params[:q].to_i
    @listings = Listing.order('created_at DESC').limit(21).offset(page_number*21).includes(:image_blob)

    render json: @listings
  end

  # GET /listings/1
  def show
    render json: @listing
  end

  # POST /listings
  def create
    @listing = current_seller.listings.build(name: params[:name], description: params[:description])
    if @listing.save
      if params[:image]
        @listing.image.purge
        if params[:image].content_type.match(/\Aimage/)
          @listing.image.attach(params[:image])
        end
      end
      render json: @listing, status: :created, location: @listing
    else
      render json: {errors: @listing.errors}, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /listings/1
  def update
    if @listing.update(listing_params)
      render json: @listing
    else
      render json: @listing.errors, status: :unprocessable_entity
    end
  end

  # DELETE /listings/1
  def destroy
    @listing.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def listing_params
      params.require(:listing).permit(:name, :description, :seller_id)
    end
end
