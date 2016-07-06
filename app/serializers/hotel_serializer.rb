class HotelSerializer < ActiveModel::Serializer

  cached

  attributes :id, :title, :rating, :breakfast, :room_description, :price_of_room, :state, :city, :street, :count_name,
             :user_id, :image
  has_one :user

  def cache_key
    [object, scope]
  end
end