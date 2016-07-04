class HotelsController < ApplicationController
  before_action :find_hotel, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit]

  def index
    @hotels = Hotel.page(params[:page]).per(1)
  end

  def new
    @hotel = current_user.hotels.build
  end

  def show
    if @hotel.reviews.blank?
      @average_review = 0
    else
      @average_review = @hotel.reviews.average(:rating).round(2)
    end
  end

  def create
    @hotel = Hotel.new(hotel_params)

    if @hotel.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @hotel.update(hotel_params)
      redirect_to hotel_path(@hotel)
    else
      render 'edit'
    end
  end

  def destroy
    @hotel = Hotel.find(params[:id])
    @hotel.destroy
    redirect_to root_path
  end

  private

  def hotel_params
    params.require(:hotel).permit( :title, :image, :breakfast, :price_of_room, :rating, :city, :street, :state, :count_name, :room_description)
  end


  def find_hotel
    @hotel = Hotel.find(params[:id])
  end


end
