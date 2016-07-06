class Hotel < ActiveRecord::Base
  belongs_to :user
  has_many :reviews
  mount_uploader :image, ImageUploader
  # validates :image, presence: true
  # validates :room_description,  presence: true, length: {minimum: 5, maximum: 1000};
  # validates :price_of_room, presence: true, numericality: {greater_than: 0}
  # validates :title, presence: true, length: {minimum: 3, maximum: 100}
  # validates :count_name, :street, :state, :city, presence: true, length: {minimum: 3, maximum: 100}
end
