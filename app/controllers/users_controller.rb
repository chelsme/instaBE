class UsersController < ApplicationController
    def index
        render json: User.all
    end

    def show
        user = User.find(params[:id])
        render json: user
    end
    
    def create
        # user = User.find_or_create_by(user_params)
        # # party_user = PartyUser.create(user_id: user.id, party_id: params[:party_id])
        # render json: user

        user = User.new(user_params)
        user.password = params[:password]
        user.password_confirmation = params[:password_confirmation]
        user.authenticate(params[:password])
        user.save

        render json: user
    end
    
    def destroy
        User.destroy(params[:id])
    end
    
    def update
        user = User.find(params[:id])
        user.update_attributes(user_params)
        render json: user
    end
    
    private
    def user_params
        params.require(:user).permit(:fullname, :username, :password, :password_confirmation, :bio, :avatar)
    end
end
