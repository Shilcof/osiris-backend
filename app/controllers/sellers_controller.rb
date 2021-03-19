class SellersController < ApplicationController
  before_action :set_seller, only: [:show, :update, :destroy]

  # GET /sellers
  def index
    @sellers = Seller.all

    render json: @sellers
  end

  def profile
    render json: { seller.as_json(:except => [:password_digest]) }, status: :accepted
  end

  # POST /sellers
  def create
    @seller = Seller.new(seller_params)

    if @seller.save
      Seller.update(name: seller_params[:email].split("@")[0])
      
      token = encode_token(seller_id: seller.id)
      render json: { seller: seller, jwt: token }, status: :created
    else
      render json: @seller.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_seller
      @seller = Seller.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def seller_params
      params.require(:seller).permit(:email, :password, :password_confirmation)
    end
end
