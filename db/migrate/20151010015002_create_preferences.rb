class CreatePreferences < ActiveRecord::Migration
  def change
    create_table :preferences do |t|
      t.boolean :is_fancy
      t.string :cuisine, :default => nil
      t.boolean :is_vegetarian
      t.integer :distance
      t.timestamps null: false

      t.references :event
    end
  end
end
