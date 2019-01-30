class PostsController < ApplicationController
  def index
    render json: Post.all
  end

  def show
    post = Post.find(params[:id])
    render json: post
  end

  def create
    post = Post.find_or_create_by(post_params)
    # party_post = PartyPost.create(post_id: Post.id, party_id: params[:party_id])
    
    render json: post

    # post = Post.new(post_params)
    # Post.password = params[:password]
    # Post.password_confirmation = params[:password_confirmation]
    # Post.authenticate(params[:password])
    # Post.save

    # render json: post
  end

  def destroy
    Post.destroy(params[:id])
  end

  def update
    post = Post.find(params[:id])
    Post.update_attributes(post_params)

    render json: post
  end

  private
  def post_params
    params.require(:post).permit(:user_id, :image, :caption)
  end
end
