class CreateHotels < ActiveRecord::Migration
  def change
    create_table :hotels do |t|
      t.string :title
      t.integer :price_of_room
      t.boolean :breakfast
      t.text :room_description
      t.string  :count_name
      t.string  :state
      t.string  :city
      t.string  :street
      t.integer :rating
      t.timestamps null: false
    end
  end
end
