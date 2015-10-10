class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :street_address
      t.string :selected_restaurant
      t.references :user

      t.timestamps null: false
    end
  end
end
