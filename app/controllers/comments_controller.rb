class CommentsController < ApplicationController
    def index
        render json: Comment.all
    end
    
    def show
        comment = Comment.find(params[:id])
        render json: comment
    end
    
    def create
        comment = Comment.find_or_create_by(comment_params)
        # party_comment = PartyComment.create(comment_id: Comment.id, party_id: params[:party_id])
        
        render json: comment
    
        # comment = Comment.new(comment_params)
        # Comment.password = params[:password]
        # Comment.password_confirmation = params[:password_confirmation]
        # Comment.authenticate(params[:password])
        # Comment.save
    
        # render json: comment
    end
    
    def destroy
        Comment.destroy(params[:id])
    end
    
    def update
        comment = Comment.find(params[:id])
        Comment.update_attributes(comment_params)
    
        render json: comment
    end
    
    private
    def comment_params
        params.require(:comment).permit(:user_id, :post_id, :text)
    end
end
