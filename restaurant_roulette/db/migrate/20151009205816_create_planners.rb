class CreatePlanners < ActiveRecord::Migration
  def change
    create_table :planners do |t|
      t.string :full_name
      t.string :email
      t.string :password
      t.string :phone_number

      t.timestamps null: false
    end
  end
end
