class CreateHotels < ActiveRecord::Migration
  def change
    create_table :hotels do |t|
      t.string :title
      t.integer :price_of_room
      t.boolean :breakfast
      t.text :address
      t.text :room_description
      t.integer :rating

      t.timestamps null: false
    end
  end
end
