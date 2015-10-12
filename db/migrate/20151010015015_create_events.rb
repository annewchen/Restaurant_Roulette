class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :street_address
      t.string :selected_restaurant_name
      t.string :selected_restaurant_address
      t.string :selected_restaurant_phone_number

      t.integer :planner_id

      t.timestamps null: false
    end
  end
end
