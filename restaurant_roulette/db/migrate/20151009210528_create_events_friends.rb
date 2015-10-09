class CreateEventsFriends < ActiveRecord::Migration
  def change
    create_table :events_friends do |t|
      t.references :event
      t.references :friend

      t.timestamps null: false
    end
  end
end
