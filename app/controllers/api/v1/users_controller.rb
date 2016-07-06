class Api::V1::UsersController < ApplicationController

  respond_to :json

  def new
    respond_with User.new
  end

  def show
    if !User.where(params[:id]).exists?
      redirect_to root_path
      flash[:notice] = 'Error find id'
    else
      respond_with User.find(params[:id])
    end
  end

  def index
    respond_with User.all
  end

  def edit
    respond_with User.find(params[:id])
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user, status: 201, location: [:api, user]
    else
      render json: {errors: user.errors}, status: 422
    end
  end

  def update
    user = current_user

    if user.update(user_params)
      render json: user, status: 200, location: [:api, user]
    else
      render json: {errors: user.errors}, status: 422
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    head 204
  end

  private

  def user_params
    params.require(:users).permit(:username, :email, :image, :image_cache, :remove_image)
  end

end