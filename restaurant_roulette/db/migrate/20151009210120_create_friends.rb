class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.string :alias
      t.string :phone_number
      t.references :planner

      t.timestamps null: false
    end
  end
end
