class CreateAttendees < ActiveRecord::Migration[5.0]
  def change
    create_table :attendees do |t|
      t.string :first_name, null: false
      t.string :surname, null: false
      t.text :address, null: false
      t.string :email, null: false
      t.string :fiance_full_name, null: false
      t.integer :age
      t.string :phone_number, null: false
      t.string :religion, null: false
      t.string :parish
      t.datetime :wedding_date, null: false
      t.string :preferred_event, null: false
      t.string :post_wedding_address, null: false
      t.string :dietary_requirements
    end
  end
end
