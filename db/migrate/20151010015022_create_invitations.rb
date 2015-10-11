class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.string :phone_number
      t.string :full_name
      t.timestamps null: false

      t.references :event
    end
  end
end
