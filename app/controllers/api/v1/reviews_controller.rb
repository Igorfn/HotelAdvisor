class Api::V1::ReviewsController < ApplicationController

  respond_to :json

  def new
    respond_with Review.new
  end

  def show
    if !Review.where(params[:id]).exists?
      redirect_to root_path
      flash[:notice] = 'Error find id'
    else
      respond_with Review.find(params[:id])
    end
  end

  def edit
    respond_with Review.find(params[:id])
  end

  def index
    respond_with Review.all
  end

  def create
    review = Review.new(user_params)
    if user.save
      render json: review, status: 201, location: [:api, review]
    else
      render json: {errors: review.errors}, status: 422
    end
  end

  def update
    review = Review.find(params[:id])

    if review.update(user_params)
      render json: review, status: 200, location: [:api, review]
    else
      render 'edit'
      render json: {errors: review.errors}, status: 422
    end
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy
    head 204
  end

  private

  def review_params
    params.require(:reviews).permit(:rating, :comment)
  end
end
