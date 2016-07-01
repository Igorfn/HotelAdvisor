class Hotel < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  validates :image, presence: true
  validates :room_description,  presence: true, length: {minimum: 5, maximum: 1000};
  validates :price_of_room, presence: true, numericality: {greater_than: 0}
  validates :rating, numericality: {greater_than: 0, less_than_or_equal_to: 5}
  validates :title, presence: true, length: {minimum: 3, maximum: 100}
  validates :address, presence: true, length: {minimum: 3, maximum: 100}
end
