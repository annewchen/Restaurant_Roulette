class CreatePreferences < ActiveRecord::Migration
  def change
    create_table :preferences do |t|
      t.string :price
      t.string :cuisine
      t.boolean :good_for_groups
      t.boolean :vegetarian
      t.integer :distance
      t.references :voter, polymorphic:true, index: true

      t.timestamps null: false
    end
  end
end
