class ApplicationController < ActionController::API
    before_action :authorized

    def encode_token(payload)
        JWT.encode(payload, ENV["JWT_SECRET"])
    end

    def auth_header
        request.headers['Authorization']
    end

    def decoded_token
        if auth_header
            token = auth_header.split(' ')[1]
            begin
                JWT.decode(token, ENV["JWT_SECRET"], true, algorithm: 'HS256')
            rescue JWT::DecodeError
                nil
            end
        end
    end

    def current_seller
        if decoded_token
            seller_id = decoded_token[0]['seller_id']
            seller = Seller.find_by(id: seller_id)
        end
    end

    def logged_in?
        !!current_seller
    end

    def authorized
        render json: { errors: 'Unauthorized. Please Login.'}, status: :unauthorized unless logged_in?
    end
end
