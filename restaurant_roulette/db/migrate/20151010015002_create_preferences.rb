class CreatePreferences < ActiveRecord::Migration
  def change
    create_table :preferences do |t|
      t.string :price
      t.string :cuisine
      t.boolean :good_for_groups
      t.boolean :vegetarian
      t.integer :distance
      t.timestamps null: false

      t.references :user
      t.references :event
    end
  end
end
