class AuthController < ApplicationController
    skip_before_action :authorized

    def create
        seller = Seller.find_by(email: login_params[:email])
        if seller && seller.authenticate(login_params[:password])
            token = encode_token({ seller_id: seller.id })
            render json: {seller: seller, jwt: token }, status: :accepted
        else
            render json: { errors: 'Invalid Credentials.' }, status: :unauthorized
        end
    end

    private

    def login_params
        params.require(:seller).permit(:email, :password)
    end
end