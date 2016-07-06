module API
  module V1
    class HotelsController < ApplicationController

      respond_to :json

      def index
        respond_with Hotel.all
      end

      def new
        respond_with Hotel.new
      end

      def show
        if !Hotel.where(params[:id]).exists?
          redirect_to root_path
          flash[:notice] = 'Error find id'
        else
          respond_with Hotel.find(params[:id])
        end
      end

      def edit
        hotel = Hotel.find(params[:id])
      end

      def create
        hotel = Hotel.new(hotel_params)
        if hotel.save
          render json: hotel, status: 201, location: [:api, hotel]
        else
          render 'edit'
        end
      end

      def update
        hotel = Hotel.find(params[:id])

        if hotel.update(hotel_params)
          render json: hotel, status: 200, location: [:api, hotel]
        else
          render json: {errors: hotel.errors}, status: 422
        end
      end

      def destroy
        hotel = Hotel.find(params[:id])
        hotel.destroy
        head 204
      end

      private

      def hotel_params
        params.require(:hotel).permit(:title, :image, :breakfast, :price_of_room, :rating, :city, :street, :state, :count_name, :room_description)
      end

    end
  end
end