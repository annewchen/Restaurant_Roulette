class CreatePreferences < ActiveRecord::Migration
  def change
    create_table :preferences do |t|
      t.boolean :is_fancy
      t.string :cuisine
      t.boolean :is_vegetarian
      t.integer :distance
      t.timestamps null: false

      t.integer :participant_id
      t.references :event
    end
  end
end
