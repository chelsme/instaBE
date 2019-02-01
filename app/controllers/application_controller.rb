class ApplicationController < ActionController::API
    def login
        user = User.find_by(username: params[:username])

        if user && user.authenticate(params[:password])
            render :json => {
                :token => JWT.encode({user_id: user.id}, nil, 'none')
            }
        else
            render :json => {
                :message => 'Invalid Credentials'
            }, status: 400
        end
    end

    def updateuser
        authorization_header = request.headers['Authorization']

        payload = nil

        if authorization_header
            payload = authorization_header.split(' ')[1]
        end

        if authorization_header && JWT.decode(payload, nil, false)[0]['user_id'] == params[:id].to_i
            # if JWT is valid
            user = User.find(params[:id])
            # byebug
            user.update(bio: params[:bio])

            render json: user
        end
    end
end
