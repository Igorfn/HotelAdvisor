class HotelsController < ApplicationController
  before_action :find_hotel, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit]

  def index
    @hotels = Hotel.page(params[:page]).per(3)
<<<<<<< HEAD
    # @top_hotels = Hotel.all.where('rating > ?', 2).limit(5)
=======
>>>>>>> 933495d07ed129b1a24e2c61b60cbc761f6598d1
  end

  def new
    @hotel = current_user.hotels.build
  end

  def show
    if @hotel.reviews.blank?
      @average_review = 0
    else
      @average_review = @hotel.reviews.average(:rating).round(2)
      @hotel.rating = @average_review
      @hotel.save
    end
  end

  def create
    @hotel = current_user.hotels.build(hotel_params)

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
