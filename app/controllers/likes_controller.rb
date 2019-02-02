class LikesController < ApplicationController
    def index
        render json: Like.all
    end
    
    def show
        like = Like.find(params[:id])
        render json: like
    end
    
    def create
        # byebug
        like = Like.create(like_params)
        # party_like = PartyLike.create(like_id: Like.id, party_id: params[:party_id])

        render json: like
    
        # like = Like.new(like_params)
        # Like.password = params[:password]
        # Like.password_confirmation = params[:password_confirmation]
        # Like.authenticate(params[:password])
        # Like.save
    
        # render json: like
    end
    
    def destroy
        Like.destroy(params[:id])
    end
    
    def update
        like = Like.find(params[:id])
        Like.update_attributes(like_params)
    
        render json: like
    end
    
    private
    def like_params
        params.permit(:user_id, :post_id)
    end
end
