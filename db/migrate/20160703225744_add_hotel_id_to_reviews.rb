class AddHotelIdToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :hotel_id, :integer
  end
end
